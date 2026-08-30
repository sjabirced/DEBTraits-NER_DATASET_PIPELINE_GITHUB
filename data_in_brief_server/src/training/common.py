"""Shared logic for the BIO trait-NER pipeline (training, evaluation, inference).

Kept in one module so the training entrypoint, the evaluators, and the
inference script all decode predictions and score them identically instead of
keeping divergent copies. The project trains a single configuration —
bert-base-cased on the BIO-tagged dataset with plain (unweighted)
cross-entropy, the "baseline" strategy — so there is no scheme/model/loss
branching here.
"""
import json
import os
from datetime import datetime, timezone
from pathlib import Path
from typing import Optional

import numpy as np
import torch
import yaml
from datasets import load_from_disk
from seqeval.metrics import classification_report, f1_score, precision_score, recall_score
from torch.utils.data import DataLoader
from transformers import (
    AutoModelForTokenClassification,
    AutoTokenizer,
    DataCollatorForTokenClassification,
    EarlyStoppingCallback,
    PrinterCallback,
    Trainer,
    TrainerCallback,
    TrainingArguments,
    set_seed,
)
from transformers.trainer_utils import get_last_checkpoint


def load_yaml(path: Path) -> dict:
    return yaml.safe_load(path.read_text())


def apply_threshold(logits: torch.Tensor, o_label_id: int, threshold: float) -> torch.Tensor:
    """Force low-confidence non-O predictions to O instead of trusting argmax.

    A prediction is only kept if it's both the highest-probability class AND
    that probability clears the threshold — trades recall for precision at
    decode time, without retraining. logits: [..., num_labels].
    """
    probs = torch.softmax(logits, dim=-1)
    max_probs, pred_ids = probs.max(dim=-1)
    low_confidence = (max_probs < threshold) & (pred_ids != o_label_id)
    pred_ids = pred_ids.clone()
    pred_ids[low_confidence] = o_label_id
    return pred_ids


def decode_predictions(predictions: np.ndarray, labels: np.ndarray, id2label: dict):
    """Strip -100 padding/subword positions and map ids back to tag strings."""
    true_labels, true_preds = [], []
    for pred_row, label_row in zip(predictions, labels):
        seq_labels, seq_preds = [], []
        for p, l in zip(pred_row, label_row):
            if l == -100:
                continue
            seq_labels.append(id2label[l])
            seq_preds.append(id2label[p])
        true_labels.append(seq_labels)
        true_preds.append(seq_preds)
    return true_labels, true_preds


def strip_entity_prefix(tag: str) -> str:
    """B-Li / I-Li -> Li, O -> O. Collapses BIO tags down to the entity-type
    set, for analysis that shouldn't care about the B/I boundary (confusion
    matrix, error breakdown)."""
    return tag if tag == "O" else tag.split("-", 1)[1]


def tags_to_spans(tags: list[str], offsets: list[tuple[int, int]]) -> list[dict]:
    """Merge a BIO tag sequence into entity spans with character offsets.

    B- opens a span, I- continues the current span when the type matches, O
    closes it. An I- with no matching open span of the same type is a malformed
    prediction — a boundary the model was never trained to produce standalone.
    It's suppressed (treated as O) rather than started as a fresh span, since
    trusting an orphan continuation tag risks surfacing a wrong or partial
    entity from what's actually a model error.
    """
    spans = []
    current = None
    for tag, (start, end) in zip(tags, offsets):
        if tag == "O":
            if current:
                spans.append(current)
                current = None
            continue
        prefix, etype = tag.split("-", 1)
        if prefix == "B":
            if current:
                spans.append(current)
            current = {"type": etype, "start": start, "end": end}
        else:  # I: continue only when it matches the open span's type
            if current and current["type"] == etype:
                current["end"] = end
            # else: orphan I- — suppressed, existing open span (if any) is left
            # untouched rather than being disrupted by it.
    if current:
        spans.append(current)
    return spans


def run_test_predictions(
    model_dir: str,
    model_cfg: dict,
    scheme_cfg: dict,
    id2label: dict,
    o_label_id: int,
    repo_root: Path,
    batch_size: int = 32,
    threshold: Optional[float] = None,
    split: str = "test",
) -> tuple[list[list[str]], list[list[str]]]:
    """Load a trained checkpoint and run it over its own test split.

    Shared by evaluate.py and generate_report.py so there's one place that
    knows how to reload a model and decode predictions consistently (same
    threshold handling, same -100 stripping), instead of two copies drifting
    apart.
    """
    data_dir = repo_root / scheme_cfg["dataset_dir"] / model_cfg["data_dirname"]
    dataset = load_from_disk(str(data_dir))[split]

    tokenizer = AutoTokenizer.from_pretrained(model_dir)
    model = AutoModelForTokenClassification.from_pretrained(model_dir)
    model.eval()
    device = "cuda" if torch.cuda.is_available() else "cpu"
    model.to(device)

    loader = DataLoader(dataset, batch_size=batch_size, collate_fn=DataCollatorForTokenClassification(tokenizer))

    true_labels, true_preds = [], []
    with torch.no_grad():
        for batch in loader:
            labels = batch.pop("labels").numpy()
            batch = {k: v.to(device) for k, v in batch.items()}
            logits = model(**batch).logits
            if threshold is not None:
                preds = apply_threshold(logits, o_label_id, threshold).cpu().numpy()
            else:
                preds = np.argmax(logits.cpu().numpy(), axis=-1)
            batch_labels, batch_preds = decode_predictions(preds, labels, id2label)
            true_labels.extend(batch_labels)
            true_preds.extend(batch_preds)

    return true_labels, true_preds


class LossAwareTrainer(Trainer):
    """Also accumulates exact per-epoch training metrics for free.

    compute_loss() runs on every training step regardless — the forward pass
    already produces the logits needed for a prediction, so decoding and
    stashing them here costs an argmax + CPU copy, not a second forward pass
    over the training set. Only accumulates when model.training is True, so
    validation/test evaluate() calls (which also go through compute_loss)
    aren't counted. pop_train_metrics() consumes and clears the buffer, called
    once per epoch by EpochLogCallback.
    """

    def __init__(self, *args, loss_fn=None, id2label=None, **kwargs):
        super().__init__(*args, **kwargs)
        self.loss_fn = loss_fn
        self.id2label = id2label
        self._train_true_labels = []
        self._train_true_preds = []
        self._train_losses = []

    def compute_loss(self, model, inputs, return_outputs=False, num_items_in_batch=None):
        labels = inputs.pop("labels")
        outputs = model(**inputs)
        logits = outputs.logits
        self.loss_fn.to(logits.device)
        loss = self.loss_fn(logits.view(-1, logits.size(-1)), labels.view(-1))

        if model.training:
            with torch.no_grad():
                preds = logits.argmax(dim=-1).cpu().numpy()
            batch_true, batch_pred = decode_predictions(preds, labels.cpu().numpy(), self.id2label)
            self._train_true_labels.extend(batch_true)
            self._train_true_preds.extend(batch_pred)
            self._train_losses.append(loss.detach().item())

        return (loss, outputs) if return_outputs else loss

    def pop_train_metrics(self) -> Optional[dict]:
        """Consume and clear this epoch's accumulated training predictions,
        returning the same metrics dict shape as compute_metrics (plus loss).
        None if nothing was accumulated (e.g. resumed straight past training)."""
        true_labels, true_preds, losses = self._train_true_labels, self._train_true_preds, self._train_losses
        self._train_true_labels, self._train_true_preds, self._train_losses = [], [], []
        if not true_labels:
            return None
        metrics = score_predictions(true_labels, true_preds)
        metrics["loss"] = sum(losses) / len(losses)
        return metrics


def score_predictions(true_labels: list[list[str]], true_preds: list[list[str]]) -> dict:
    """Given already-decoded BIO tag sequences, compute the overall + per-entity
    precision/recall/f1/accuracy dict used everywhere in this project. Shared by
    the Trainer-driven eval path (compute_metrics, below) and the "free"
    training-step accumulation in LossAwareTrainer, so both go through
    identical scoring logic rather than two copies that could drift apart.
    """
    report = classification_report(true_labels, true_preds, output_dict=True, zero_division=0)
    n_correct = sum(t == p for seq_t, seq_p in zip(true_labels, true_preds) for t, p in zip(seq_t, seq_p))
    n_total = sum(len(seq) for seq in true_labels)
    metrics = {
        "precision": precision_score(true_labels, true_preds),
        "recall": recall_score(true_labels, true_preds),
        "f1": f1_score(true_labels, true_preds),
        "accuracy": n_correct / n_total if n_total else 0.0,
    }
    # Full per-entity-type precision/recall/f1/support so rare classes (GSI, Wwx,
    # Ww0, ...) don't hide behind a healthy-looking micro-average. These land in
    # the metrics dict — and so in test_metrics.json — as precision_<Type>,
    # recall_<Type>, f1_<Type>, support_<Type>, and are what format_per_entity_table
    # renders into the .out log.
    for etype, scores in report.items():
        if etype in ("micro avg", "macro avg", "weighted avg"):
            continue
        metrics[f"precision_{etype}"] = scores["precision"]
        metrics[f"recall_{etype}"] = scores["recall"]
        metrics[f"f1_{etype}"] = scores["f1-score"]
        metrics[f"support_{etype}"] = scores["support"]
    return metrics


def format_per_entity_table(metrics: dict, prefix: str) -> str:
    """Render the per-entity precision/recall/f1/support already in a metrics
    dict (keys like f"{prefix}_f1_<Type>", produced by score_predictions with the
    Trainer's eval/test prefix applied) as an aligned table for the .out log."""
    entity_types = sorted(
        key[len(prefix) + 4:] for key in metrics if key.startswith(f"{prefix}_f1_")
    )
    lines = [
        f"{'Entity':<12}{'Precision':>12}{'Recall':>12}{'F1':>12}{'Support':>10}",
        "-" * 58,
    ]
    for etype in entity_types:
        precision = metrics.get(f"{prefix}_precision_{etype}", 0.0)
        recall = metrics.get(f"{prefix}_recall_{etype}", 0.0)
        f1 = metrics.get(f"{prefix}_f1_{etype}", 0.0)
        support = metrics.get(f"{prefix}_support_{etype}", 0)
        lines.append(f"{etype:<12}{precision:>12.4f}{recall:>12.4f}{f1:>12.4f}{int(support):>10}")
    return "\n".join(lines)


def build_compute_metrics(id2label: dict):
    def compute_metrics(eval_pred):
        predictions, labels = eval_pred
        predictions = np.argmax(predictions, axis=-1)
        true_labels, true_preds = decode_predictions(predictions, labels, id2label)
        return score_predictions(true_labels, true_preds)

    return compute_metrics


def _fmt_loss(value: float) -> str:
    """Scientific notation below 1e-3 so a near-zero loss late in a long run
    doesn't collapse to an uninformative "0.0000"."""
    return f"{value:.6e}" if value < 0.001 else f"{value:.4f}"


class EpochLogCallback(TrainerCallback):
    """Prints a clean per-epoch Train/Val/Test summary instead of HF's default
    tqdm bars + dict-style log lines, e.g.:

        Epoch 50/50
        ------------------------------------------------------------
        Train - Loss: 0.0047, P: 0.8343, R: 0.9775, F1: 0.9003, Acc: 0.9847
        Val   - Loss: 1.2116, P: 0.7716, R: 0.9034, F1: 0.8323, Acc: 0.9768
        Test  - Loss: 0.0225, P: 0.8930, R: 0.9565, F1: 0.9236, Acc: 0.9936
         New best model saved (F1: 0.8323)

    "Train" numbers come from LossAwareTrainer.pop_train_metrics() — exact
    full-training-set metrics accumulated as a side effect of the training
    forward passes themselves (see LossAwareTrainer), not a separate eval
    pass. "Val" comes from the metrics dict Trainer's own eval_strategy="epoch"
    already computes on the full validation set. "Test" is an extra held-out
    pass this callback runs each epoch over test_dataset (see below).

    Hooks on_evaluate (fires right when the official per-epoch validation
    pass finishes, with its metrics dict passed straight in) rather than
    on_epoch_end, which actually fires *before* that validation pass runs.
    best_metric tracking is done locally rather than via state.best_metric,
    since Trainer only updates that during the save step, which happens
    after on_evaluate — reading it here would always lag one epoch behind. The
    "New best model saved" line is still keyed off validation F1 (eval_f1), which
    is what actually drives checkpoint selection — the per-epoch test numbers are
    reported for monitoring only and never influence which model is kept.
    """

    def __init__(self, trainer: Trainer, total_epochs: int, test_dataset=None):
        self.trainer = trainer
        self.total_epochs = total_epochs
        self.test_dataset = test_dataset
        self.best_f1_so_far = None

    def on_evaluate(self, args, state, control, metrics=None, **kwargs):
        if metrics is None or not any(k.startswith("eval_") for k in metrics):
            return

        train_metrics = self.trainer.pop_train_metrics()

        # Extra per-epoch test-set pass. Uses predict() rather than evaluate() on
        # purpose: predict() fires on_predict (not on_evaluate), so it neither
        # re-enters this callback nor feeds test metrics into EarlyStopping /
        # best-model tracking (both of which key off the validation eval_f1). It
        # roughly doubles per-epoch eval time (test set ≈ validation set in
        # size) — that's the deliberate cost of tracking test alongside val.
        test_metrics = None
        if self.test_dataset is not None:
            test_metrics = self.trainer.predict(self.test_dataset, metric_key_prefix="test").metrics

        print(f"\nEpoch {round(state.epoch)}/{self.total_epochs}")
        print("-" * 60)
        if train_metrics:
            print(
                f"Train - Loss: {_fmt_loss(train_metrics['loss'])}, "
                f"P: {train_metrics['precision']:.4f}, R: {train_metrics['recall']:.4f}, "
                f"F1: {train_metrics['f1']:.4f}, Acc: {train_metrics['accuracy']:.4f}"
            )
        print(
            f"Val   - Loss: {_fmt_loss(metrics['eval_loss'])}, "
            f"P: {metrics['eval_precision']:.4f}, R: {metrics['eval_recall']:.4f}, "
            f"F1: {metrics['eval_f1']:.4f}, Acc: {metrics['eval_accuracy']:.4f}"
        )
        if test_metrics:
            print(
                f"Test  - Loss: {_fmt_loss(test_metrics['test_loss'])}, "
                f"P: {test_metrics['test_precision']:.4f}, R: {test_metrics['test_recall']:.4f}, "
                f"F1: {test_metrics['test_f1']:.4f}, Acc: {test_metrics['test_accuracy']:.4f}"
            )
        current_f1 = metrics["eval_f1"]
        if self.best_f1_so_far is None or current_f1 > self.best_f1_so_far:
            self.best_f1_so_far = current_f1
            print(f" New best model saved (F1: {current_f1:.4f})")
        print()


def _record_run_event(out_path: Path, event: str, **fields) -> None:
    """Append a Slurm job ID to this run's provenance record.

    The output directory path is stable across resubmissions (so resume-from-
    checkpoint works), so it can't encode which Slurm job produced a given
    result — this file is what answers that instead. Every job ID that ever
    touched this run ends up in job_id_history, e.g. if a run timed out twice
    before finally completing.
    """
    run_info_path = out_path / "run_info.json"
    info = json.loads(run_info_path.read_text()) if run_info_path.exists() else {"job_id_history": []}

    job_id = os.environ.get("SLURM_JOB_ID", "local")
    if job_id not in info["job_id_history"]:
        info["job_id_history"].append(job_id)

    info["last_job_id"] = job_id
    info["last_node"] = os.environ.get("SLURMD_NODENAME") or os.environ.get("SLURM_NODELIST", "local")
    info["last_event"] = event
    info["last_event_at"] = datetime.now(timezone.utc).isoformat()
    info.update(fields)

    run_info_path.write_text(json.dumps(info, indent=2))


def run_training(output_dir: str, config_dir: Path, repo_root: Path, force: bool = False) -> dict:
    """Fine-tune bert-base-cased for cross-entropy BIO trait NER.

    force=True ignores a completed previous run in output_dir and retrains from
    scratch — needed whenever bio_dataset/ has been regenerated, since the guard
    below cannot tell "already trained on this data" from "already trained on
    data that has since been replaced".
    """
    out_path = Path(output_dir)
    out_path.mkdir(parents=True, exist_ok=True)

    # Idempotent re-submission: if a previous attempt already finished, don't
    # burn GPU-hours redoing it. This keys off the output directory alone, which
    # is stable across resubmissions and says nothing about which dataset
    # produced it — so after regenerating bio_dataset/ this guard would silently
    # no-op a job that looks successful (exit 0, "JOB COMPLETE"). --force is the
    # escape hatch; the message spells it out rather than leaving the reader to
    # work out why nothing trained.
    existing_metrics = out_path / "test_metrics.json"
    if existing_metrics.exists() and not force:
        print(f"{existing_metrics} already exists — training already completed, skipping.")
        print("")
        print("If the dataset changed since that run, this is NOT what you want.")
        print("Either resubmit with --force, or move the old output directory aside:")
        print(f"    mv {out_path} {out_path}_old")
        _record_run_event(out_path, "skipped_already_complete")
        return json.loads(existing_metrics.read_text())

    if existing_metrics.exists():
        print(f"--force: ignoring the existing {existing_metrics.name} and retraining from scratch.")

    _record_run_event(out_path, "started")

    model_cfg = load_yaml(config_dir / "model" / "bert.yaml")
    scheme_cfg = load_yaml(config_dir / "scheme" / "bio.yaml")

    set_seed(model_cfg["seed"])

    label_mapping = json.loads((repo_root / scheme_cfg["label_mapping"]).read_text())
    id2label = {int(k): v for k, v in label_mapping["id2label"].items()}
    label2id = label_mapping["label2id"]
    num_labels = len(id2label)

    data_dir = repo_root / scheme_cfg["dataset_dir"] / model_cfg["data_dirname"]
    dataset = load_from_disk(str(data_dir))

    tokenizer = AutoTokenizer.from_pretrained(model_cfg["checkpoint"])
    # Dropout is read from the model config so it can be raised above the
    # checkpoint's 0.1 pretrained default as an overfitting regularizer. Only
    # passed when present, so an unset config keeps the checkpoint's own default.
    model_kwargs = dict(num_labels=num_labels, id2label=id2label, label2id=label2id)
    for k in ("hidden_dropout_prob", "attention_probs_dropout_prob"):
        if k in model_cfg:
            model_kwargs[k] = model_cfg[k]
    model = AutoModelForTokenClassification.from_pretrained(model_cfg["checkpoint"], **model_kwargs)

    # Cross-entropy with label_smoothing=0.1 as an anti-overfitting regularizer:
    # it stops the model from driving predicted probabilities to 1.0 on the
    # training set (exactly what makes train loss collapse to ~0 and val loss
    # climb), so it directly shrinks the train/val gap. Set label_smoothing=0.0
    # to fall back to the plain baseline.
    loss_fn = torch.nn.CrossEntropyLoss(ignore_index=-100, label_smoothing=0.1)

    training_args = TrainingArguments(
        output_dir=output_dir,
        per_device_train_batch_size=model_cfg["per_device_train_batch_size"],
        per_device_eval_batch_size=model_cfg["per_device_eval_batch_size"],
        gradient_accumulation_steps=model_cfg.get("gradient_accumulation_steps", 1),
        learning_rate=float(model_cfg["learning_rate"]),
        num_train_epochs=model_cfg["num_train_epochs"],
        warmup_ratio=model_cfg.get("warmup_ratio", 0.1),
        weight_decay=model_cfg.get("weight_decay", 0.01),
        fp16=model_cfg.get("fp16", False),
        bf16=model_cfg.get("bf16", False),
        eval_strategy="epoch",
        save_strategy="epoch",
        load_best_model_at_end=True,
        metric_for_best_model="f1",
        greater_is_better=True,
        logging_steps=50,
        save_total_limit=2,
        report_to="none",
        seed=model_cfg["seed"],
        disable_tqdm=True,
        # EpochLogCallback runs a nested trainer.predict() on the test set from
        # inside on_evaluate each epoch; the memory tracker isn't nesting-safe,
        # so keep it off (it's HF's default anyway, set explicitly here so this
        # doesn't silently break if that default ever flips).
        skip_memory_metrics=True,
    )

    trainer = LossAwareTrainer(
        model=model,
        args=training_args,
        train_dataset=dataset["train"],
        eval_dataset=dataset["validation"],
        data_collator=DataCollatorForTokenClassification(tokenizer),
        compute_metrics=build_compute_metrics(id2label),
        loss_fn=loss_fn,
        id2label=id2label,
    )
    trainer.remove_callback(PrinterCallback)
    trainer.add_callback(EpochLogCallback(trainer, model_cfg["num_train_epochs"], dataset["test"]))
    # Stop once val F1 hasn't improved for this many consecutive epochs, rather
    # than always grinding the full num_train_epochs. Patience of 10 is set from
    # a full-50-epoch pilot whose longest gap between two val-F1 improvements
    # that a later epoch actually beat was 9 epochs, so a patience below 9 would
    # truncate a run that's still genuinely (if marginally) improving; 10 gives
    # a one-epoch margin. Requires load_best_model_at_end + metric_for_best_model
    # ="f1" (both set above), which also mean the best-F1 checkpoint is what's
    # saved regardless of where the stop lands — early stopping only skips wasted
    # post-plateau epochs, it never changes which model is kept.
    trainer.add_callback(EarlyStoppingCallback(early_stopping_patience=10))

    # If this is a resubmission after a killed/crashed previous attempt,
    # continue from the last saved epoch instead of starting over. Under --force
    # the old checkpoints belong to a superseded dataset, so resuming from them
    # would silently carry that run forward — start clean instead.
    last_checkpoint = None if force else get_last_checkpoint(output_dir)
    if last_checkpoint:
        print(f"Found existing checkpoint, resuming from {last_checkpoint}")
    elif force:
        print("--force: ignoring any existing checkpoint, starting from the base model.")
    trainer.train(resume_from_checkpoint=last_checkpoint)

    # load_best_model_at_end reloads the best checkpoint with a raw
    # load_state_dict(strict=False), which does not apply transformers' legacy
    # LayerNorm gamma/beta -> weight/bias key mapping. save_pretrained writes
    # those 50 tensors under the legacy names, so they silently fail to load and
    # keep the LAST epoch's values while every other weight comes from the best
    # epoch — the .err log shows this as 50 "missing"/50 "unexpected" keys.
    # from_pretrained does apply the mapping, so reloading through it makes the
    # model scored and saved below genuinely the best checkpoint.
    best_ckpt = trainer.state.best_model_checkpoint
    if best_ckpt and Path(best_ckpt).exists():
        print(f"Reloading best checkpoint via from_pretrained: {best_ckpt}")
        best_model = AutoModelForTokenClassification.from_pretrained(best_ckpt)
        best_model.to(trainer.args.device)
        trainer.model = best_model
        trainer.model_wrapped = best_model

    # Final results of the best (highest val-F1) model on ALL THREE splits,
    # printed to the .out log: overall line + the full per-entity precision/
    # recall/F1/support table for train, validation, and test. Evaluating the
    # final model on the 153k-example train set adds a couple of minutes, but
    # gives the complete per-entity picture requested. test_metrics.json still
    # holds the test split's metrics.
    split_specs = [("train", "train", "TRAIN"), ("validation", "val", "VALIDATION"), ("test", "test", "TEST")]
    test_metrics = None
    for split, prefix, title in split_specs:
        metrics = trainer.predict(dataset[split], metric_key_prefix=prefix).metrics
        if split == "test":
            test_metrics = metrics
        print("\n" + "=" * 60)
        print(f"FINAL {title} RESULTS (best model)")
        print("=" * 60)
        print(
            f"Precision: {metrics[f'{prefix}_precision']:.4f}   "
            f"Recall: {metrics[f'{prefix}_recall']:.4f}   "
            f"F1: {metrics[f'{prefix}_f1']:.4f}   "
            f"Accuracy: {metrics[f'{prefix}_accuracy']:.4f}"
        )
        print(f"\nPer-entity metrics ({split} set):")
        print(format_per_entity_table(metrics, prefix))
        print("=" * 60)

    (out_path / "test_metrics.json").write_text(json.dumps(test_metrics, indent=2))
    trainer.save_model(str(out_path / "final_model"))
    _record_run_event(out_path, "completed")

    return test_metrics
