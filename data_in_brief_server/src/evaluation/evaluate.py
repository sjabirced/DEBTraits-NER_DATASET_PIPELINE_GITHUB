"""Detailed per-class evaluation of the saved checkpoint on its test split.

train_ner_bio.py already writes a summary test_metrics.json right after
training. This script reloads a saved final_model/ and prints the full seqeval
classification report (precision/recall/f1 per entity type), for digging into a
single run — e.g. why a rare class like GSI underperforms.

For confusion matrices, error analysis, and a paper-ready report, see
generate_report.py instead — this one is the quick single-report tool.

Usage:
    python src/evaluation/evaluate.py \
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


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--model_dir", required=True, help="path to a saved final_model/ directory")
    parser.add_argument("--config_dir", default=str(REPO_ROOT / "configs"))
    parser.add_argument("--batch_size", type=int, default=32)
    parser.add_argument(
        "--threshold", type=float, default=None,
        help="only commit to a non-O prediction if its confidence clears this (0-1); "
             "default is plain argmax. Trades recall for precision without retraining.",
    )
    args = parser.parse_args()

    config_dir = Path(args.config_dir)
    model_cfg = load_yaml(config_dir / "model" / "bert.yaml")
    scheme_cfg = load_yaml(config_dir / "scheme" / "bio.yaml")

    label_mapping = json.loads((REPO_ROOT / scheme_cfg["label_mapping"]).read_text())
    id2label = {int(k): v for k, v in label_mapping["id2label"].items()}
    o_label_id = label_mapping["label2id"]["O"]

    true_labels, true_preds = run_test_predictions(
        args.model_dir, model_cfg, scheme_cfg, id2label, o_label_id, REPO_ROOT,
        batch_size=args.batch_size, threshold=args.threshold,
    )

    report = classification_report(true_labels, true_preds, digits=4, zero_division=0)
    print(report)

    out_path = Path(args.model_dir).parent / "classification_report.txt"
    out_path.write_text(report)
    print(f"Saved to {out_path}")


if __name__ == "__main__":
    main()
