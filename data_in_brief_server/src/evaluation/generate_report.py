"""Publication-ready evaluation report for the trained checkpoint: confusion
matrix, error analysis, per-entity CSV exports, and a paper-style report with a
ready-to-paste LaTeX table.

The confusion matrix and error analysis are built at the entity-type level
(Li, Lp, T, ... + O), not the raw per-tag level (B-Li, I-Li, ...): stripping
the B/I prefix keeps the matrix small and interpretable, which is what you'd
actually put in a paper.

Usage:
    python src/evaluation/generate_report.py \
        --model_dir outputs/bio/bert/baseline/final_model
"""
import argparse
import csv
import json
import sys
from collections import Counter
from pathlib import Path

from seqeval.metrics import classification_report

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "training"))
from common import load_yaml, run_test_predictions, strip_entity_prefix  # noqa: E402

REPO_ROOT = Path(__file__).resolve().parent.parent.parent


def build_confusion_matrix(true_types: list[str], pred_types: list[str]) -> tuple[list[str], list[list[int]]]:
    labels = sorted(set(true_types) | set(pred_types), key=lambda x: (x != "O", x))
    idx = {label: i for i, label in enumerate(labels)}
    matrix = [[0] * len(labels) for _ in labels]
    for t, p in zip(true_types, pred_types):
        matrix[idx[t]][idx[p]] += 1
    return labels, matrix


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--model_dir", required=True, help="path to a saved final_model/ directory")
    parser.add_argument("--config_dir", default=str(REPO_ROOT / "configs"))
    parser.add_argument("--batch_size", type=int, default=32)
    parser.add_argument("--threshold", type=float, default=None)
    parser.add_argument("--output_dir", default=None, help="default: alongside --model_dir")
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

    # Entity-level P/R/F1 via seqeval (span-aware).
    report = classification_report(true_labels, true_preds, output_dict=True, zero_division=0)

    # Confusion matrix + error analysis at the entity-type level (token-wise,
    # prefix stripped) — a coarser view than the seqeval span-level report
    # above: it catches token-level confusions (e.g. a continuation token
    # predicted as the wrong type) that span-level scoring can mask.
    flat_true = [strip_entity_prefix(t) for seq in true_labels for t in seq]
    flat_pred = [strip_entity_prefix(t) for seq in true_preds for t in seq]
    cm_labels, cm_matrix = build_confusion_matrix(flat_true, flat_pred)

    error_counts = Counter((t, p) for t, p in zip(flat_true, flat_pred) if t != p)
    total_errors = sum(error_counts.values())

    output_dir = Path(args.output_dir) if args.output_dir else Path(args.model_dir).parent
    output_dir.mkdir(parents=True, exist_ok=True)

    # --- per_entity_performance.csv ---
    with open(output_dir / "per_entity_performance.csv", "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["entity_type", "precision", "recall", "f1_score", "support"])
        for etype, scores in sorted(report.items()):
            if etype in ("micro avg", "macro avg", "weighted avg") or not isinstance(scores, dict):
                continue
            writer.writerow([etype, f"{scores['precision']:.4f}", f"{scores['recall']:.4f}",
                              f"{scores['f1-score']:.4f}", scores["support"]])

    # --- confusion_matrix.csv ---
    with open(output_dir / "confusion_matrix.csv", "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["true\\pred"] + cm_labels)
        for label, row in zip(cm_labels, cm_matrix):
            writer.writerow([label] + row)

    # --- error_analysis.csv ---
    with open(output_dir / "error_analysis.csv", "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["true_type", "predicted_type", "count", "pct_of_all_errors"])
        for (true_type, pred_type), count in error_counts.most_common(50):
            pct = 100 * count / total_errors if total_errors else 0
            writer.writerow([true_type, pred_type, count, f"{pct:.2f}"])

    # --- paper_report.txt ---
    micro = report.get("micro avg", {})
    macro = report.get("macro avg", {})
    weighted = report.get("weighted avg", {})
    n_correct = sum(t == p for t, p in zip(flat_true, flat_pred))
    accuracy = n_correct / len(flat_true) if flat_true else 0.0

    lines = []
    lines.append("=" * 80)
    lines.append("NER MODEL EVALUATION REPORT")
    lines.append("=" * 80)
    lines.append(f"Model:    {model_cfg['checkpoint']}")
    lines.append("Scheme:   bio")
    lines.append("Loss:     baseline (unweighted cross-entropy)")
    if args.threshold is not None:
        lines.append(f"Threshold: {args.threshold}")
    lines.append(f"Test examples: {len(true_labels)}, tokens: {len(flat_true)}")
    lines.append("=" * 80 + "\n")

    lines.append("OVERALL PERFORMANCE (entity-level, seqeval)")
    lines.append("-" * 80)
    lines.append(f"Precision: {micro.get('precision', 0):.4f}   Recall: {micro.get('recall', 0):.4f}   "
                  f"F1: {micro.get('f1-score', 0):.4f}   Token accuracy: {accuracy:.4f}")
    lines.append(f"Macro    - P: {macro.get('precision', 0):.4f}  R: {macro.get('recall', 0):.4f}  "
                  f"F1: {macro.get('f1-score', 0):.4f}")
    lines.append(f"Weighted - P: {weighted.get('precision', 0):.4f}  R: {weighted.get('recall', 0):.4f}  "
                  f"F1: {weighted.get('f1-score', 0):.4f}\n")

    lines.append("PER-ENTITY PERFORMANCE")
    lines.append("-" * 80)
    lines.append(f"{'Entity Type':<15}{'Precision':>12}{'Recall':>12}{'F1-Score':>12}{'Support':>10}")
    entity_items = sorted(
        ((k, v) for k, v in report.items() if k not in ("micro avg", "macro avg", "weighted avg")),
        key=lambda kv: kv[1]["f1-score"],
    )
    for etype, scores in entity_items:
        lines.append(f"{etype:<15}{scores['precision']:>12.4f}{scores['recall']:>12.4f}"
                      f"{scores['f1-score']:>12.4f}{scores['support']:>10}")
    lines.append("")

    lines.append(f"TOP 20 MOST COMMON ERRORS (of {total_errors} total, entity-type level)")
    lines.append("-" * 80)
    lines.append(f"{'True':<20}{'Predicted':<20}{'Count':>10}{'%':>8}")
    for (true_type, pred_type), count in error_counts.most_common(20):
        pct = 100 * count / total_errors if total_errors else 0
        lines.append(f"{true_type:<20}{pred_type:<20}{count:>10}{pct:>7.2f}%")
    lines.append("")

    lines.append("LATEX TABLE")
    lines.append("-" * 80)
    lines.append("% Copy this into your LaTeX document")
    lines.append("\\begin{table}[ht]")
    lines.append("\\centering")
    lines.append("\\caption{NER performance on test set (BIO, baseline)}")
    lines.append("\\begin{tabular}{lcccc}")
    lines.append("\\hline")
    lines.append("Entity Type & Precision & Recall & F1-Score & Support \\\\")
    lines.append("\\hline")
    for etype, scores in sorted(entity_items, key=lambda kv: kv[0]):
        escaped = etype.replace("_", "\\_")
        lines.append(f"{escaped} & {scores['precision']:.3f} & {scores['recall']:.3f} & "
                      f"{scores['f1-score']:.3f} & {scores['support']} \\\\")
    lines.append("\\hline")
    lines.append(f"Overall & {micro.get('precision', 0):.3f} & {micro.get('recall', 0):.3f} & "
                  f"{micro.get('f1-score', 0):.3f} & - \\\\")
    lines.append("\\hline")
    lines.append("\\end{tabular}")
    lines.append("\\label{tab:ner_performance}")
    lines.append("\\end{table}")
    lines.append("\n" + "=" * 80)

    report_text = "\n".join(lines)
    (output_dir / "paper_report.txt").write_text(report_text)

    print(report_text)
    print(f"\nWrote: {output_dir / 'paper_report.txt'}")
    print(f"Wrote: {output_dir / 'per_entity_performance.csv'}")
    print(f"Wrote: {output_dir / 'confusion_matrix.csv'}")
    print(f"Wrote: {output_dir / 'error_analysis.csv'}")


if __name__ == "__main__":
    main()
