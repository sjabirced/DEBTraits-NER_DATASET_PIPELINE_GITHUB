"""Self-contained NER inference helper for the test notebook.

Loads the trained bert-base-cased BIO `final_model/` checkpoint and extracts
trait entities from raw text. Intentionally has NO dependency on src/ — only
torch + transformers — so the notebook can import it without any package
install. The notebook is two lines: import this, then call extract_and_show().

The word tokenizer reproduces the training data's tokenization convention
(decimals like "0.9" kept whole, punctuation split off as its own token) so that
numeric trait measurements — most of this dataset's entities (Li, Lp, Ww*, t*) —
line up with what the model was actually trained on. This mirrors
src/inference/predict.py; kept as a small standalone copy here so the notebook
stays dependency-free. The label set (id2label) is read straight from the saved
model's own config, so no external label_mapping.json is needed.
"""
from __future__ import annotations

import re
from pathlib import Path

import torch
from transformers import AutoModelForTokenClassification, AutoTokenizer

# This file lives in inference_tests/, so the project root is one level up.
REPO_ROOT = Path(__file__).resolve().parent.parent

MODEL_DIR = REPO_ROOT / "outputs" / "bio" / "bert" / "baseline" / "final_model"

# The default passage to annotate (common tern). Pass text="..." to override.
DEFAULT_TEXT = ("The common tern (Sterna hirundo) is a migratory seabird that breeds across temperate regions of Europe, Asia, and North America before wintering along tropical and subtropical coasts. Breeding pairs usually establish nests on sandy or gravelly islands, where both parents take turns incubating the eggs while defending the colony against predators. The incubation period generally lasts between 21 and 23 days, after which the chicks hatch covered with down and weighing approximately 20 to 22 g. During the following weeks, their growth depends heavily on the continuous delivery of small fish by both parents, and most young birds become capable of sustained flight at around 24 to 27 days after hatching. At that stage, they typically weigh 110 to 125 g, although they often continue to receive food from their parents for several additional days while refining their flying and foraging skills. Adults eventually reach a stable body length of 31 to 35 cm, with only minor differences between males and females. In the wild, individuals commonly survive for more than 15 years, and long-term monitoring programs have recorded some exceptionally old birds that lived well beyond this age.")

_SENTENCE_SPLIT = re.compile(r"(?<=[.!?])\s+")
# Numbers with decimals/commas kept whole; words; single punctuation chars.
_WORD_PATTERN = re.compile(r"\d+(?:[.,]\d+)*|\w+|[^\w\s]")


def _tokenize(sentence: str):
    words, offsets = [], []
    for m in _WORD_PATTERN.finditer(sentence):
        words.append(m.group())
        offsets.append((m.start(), m.end()))
    return words, offsets


def _tags_to_spans(tags, offsets):
    """Merge a BIO tag sequence into entity spans. Orphan I- tags (a continue
    with no matching open span of the same type) are suppressed to O rather than
    trusted, matching the logic in src/training/common.py."""
    spans, current = [], None
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
        else:  # I: continue only if it matches the open span's type
            if current and current["type"] == etype:
                current["end"] = end
    if current:
        spans.append(current)
    return spans


def extract_entities(text=DEFAULT_TEXT, threshold=None):
    """Return a list of {type, text, sentence} for the trained bert baseline.

    threshold: if set (0-1), a non-O prediction is only kept when its softmax
    confidence clears it — trades recall for precision without retraining.
    """
    if not MODEL_DIR.exists():
        raise FileNotFoundError(
            f"No trained model at:\n  {MODEL_DIR}\n\n"
            f"This needs outputs/bio/bert/baseline/final_model/ to exist. "
            f"Train it on Narval (sbatch slurm/train/bio/train_bert_baseline.sbatch) "
            f"and rsync it down first."
        )

    tokenizer = AutoTokenizer.from_pretrained(str(MODEL_DIR), add_prefix_space=True)
    mdl = AutoModelForTokenClassification.from_pretrained(str(MODEL_DIR))
    mdl.eval()

    id2label = {int(k): v for k, v in mdl.config.id2label.items()}
    o_label_id = mdl.config.label2id["O"]
    # model_max_length is unreliable on some checkpoints (~1e30); cap by the
    # positional limit so a long sentence truncates instead of crashing.
    max_length = min(tokenizer.model_max_length, mdl.config.max_position_embeddings)

    results = []
    for sentence in [s for s in _SENTENCE_SPLIT.split(text.strip()) if s]:
        words, word_offsets = _tokenize(sentence)
        if not words:
            continue
        enc = tokenizer(
            words, is_split_into_words=True, return_tensors="pt",
            truncation=True, max_length=max_length,
        )
        word_ids = enc.word_ids(batch_index=0)
        with torch.no_grad():
            logits = mdl(**enc).logits[0]

        if threshold is not None:
            probs = torch.softmax(logits, dim=-1)
            max_probs, pred = probs.max(dim=-1)
            pred = pred.clone()
            pred[(max_probs < threshold) & (pred != o_label_id)] = o_label_id
            pred_ids = pred.tolist()
        else:
            pred_ids = logits.argmax(dim=-1).tolist()

        # Only the first sub-token of each word carries a real prediction — the
        # rest were masked (-100) during training.
        seen, tags, span_offsets = set(), [], []
        for i, wid in enumerate(word_ids):
            if wid is None or wid in seen:
                continue
            seen.add(wid)
            tags.append(id2label[pred_ids[i]])
            span_offsets.append(word_offsets[wid])

        for span in _tags_to_spans(tags, span_offsets):
            results.append({
                "type": span["type"],
                "text": sentence[span["start"]:span["end"]],
                "sentence": sentence,
            })
    return results


def extract_and_show(text=DEFAULT_TEXT, threshold=None):
    """Run extract_entities and pretty-print a TYPE / TEXT table. Returns the list."""
    header = "Model: bert   Strategy: baseline   Scheme: bio"
    if threshold is not None:
        header += f"   threshold={threshold}"
    print(header)
    print("=" * max(70, len(header)))

    ents = extract_entities(text, threshold)
    if not ents:
        print("No entities extracted.")
        return ents

    type_w = max(len("TYPE"), max(len(e["type"]) for e in ents))
    print(f"{'TYPE'.ljust(type_w)}   TEXT")
    print(f"{'-' * type_w}   {'-' * 34}")
    for e in ents:
        print(f"{e['type'].ljust(type_w)}   {e['text']}")
    print(f"\n{len(ents)} entities extracted.")
    return ents
