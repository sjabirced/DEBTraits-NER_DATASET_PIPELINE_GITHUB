"""Per-entity precision/recall/F1/support tables for train, validation, AND test,
computed on a SAVED final_model/ — NO retraining needed.

Use this to get the full per-entity breakdown for a model you've already trained:
it just reloads the checkpoint and runs inference over each split. (The per-epoch
train/val/test curves live only in the training .out log — those are produced
during training and can't be regenerated here.)

Usage:
    python src/evaluation/per_entity_report.py \
        --model_dir outputs/bio/bert/baseline/final_model
"""
import argparse
import json
import sys
from pathlib import Path

from seqeval.metrics import classification_report

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "training"))
from common import load_yaml, run_test_predictions  # noqa: E402

REPO_ROOT = Path(__file__).resolve().parent.parent.parent


def format_table(report: dict) -> str:
    lines = [
        f"{'Entity':<12}{'Precision':>12}{'Recall':>12}{'F1':>12}{'Support':>10}",
        "-" * 58,
    ]
    for etype, scores in sorted(report.items()):
        if etype in ("micro avg", "macro avg", "weighted avg") or not isinstance(scores, dict):
            continue
        lines.append(f"{etype:<12}{scores['precision']:>12.4f}{scores['recall']:>12.4f}"
                     f"{scores['f1-score']:>12.4f}{int(scores['support']):>10}")
    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--model_dir", required=True, help="path to a saved final_model/ directory")
    parser.add_argument("--config_dir", default=str(REPO_ROOT / "configs"))
    parser.add_argument("--batch_size", type=int, default=64)
    parser.add_argument("--threshold", type=float, default=None)
    parser.add_argument("--output_dir", default=None, help="where to save the tables (default: alongside --model_dir)")
    args = parser.parse_args()

    config_dir = Path(args.config_dir)
    model_cfg = load_yaml(config_dir / "model" / "bert.yaml")
    scheme_cfg = load_yaml(config_dir / "scheme" / "bio.yaml")

    label_mapping = json.loads((REPO_ROOT / scheme_cfg["label_mapping"]).read_text())
    id2label = {int(k): v for k, v in label_mapping["id2label"].items()}
    o_label_id = label_mapping["label2id"]["O"]

    output_dir = Path(args.output_dir) if args.output_dir else Path(args.model_dir).parent
    output_dir.mkdir(parents=True, exist_ok=True)

    blocks = []
    for split in ("train", "validation", "test"):
        true_labels, true_preds = run_test_predictions(
            args.model_dir, model_cfg, scheme_cfg, id2label, o_label_id, REPO_ROOT,
            batch_size=args.batch_size, threshold=args.threshold, split=split,
        )
        report = classification_report(true_labels, true_preds, output_dict=True, zero_division=0)
        micro = report.get("micro avg", {})
        block = "\n".join([
            "=" * 58,
            f"{split.upper()} — overall  P: {micro.get('precision', 0):.4f}  "
            f"R: {micro.get('recall', 0):.4f}  F1: {micro.get('f1-score', 0):.4f}",
            "=" * 58,
            f"Per-entity metrics ({split} set):",
            format_table(report),
            "",
        ])
        print(block)
        blocks.append(block)

    report_path = output_dir / "per_entity_all_splits.txt"
    report_path.write_text("\n".join(blocks))
    print(f"Wrote {report_path}")


if __name__ == "__main__":
    main()
