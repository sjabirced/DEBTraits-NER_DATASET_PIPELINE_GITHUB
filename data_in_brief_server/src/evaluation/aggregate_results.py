"""Collect test_metrics.json from every completed run under outputs/ into one
CSV table (scheme/model/loss + metrics per row). With the single bio/bert/
baseline run this is one row; it still works unchanged if more runs are added.

Usage:
    python src/evaluation/aggregate_results.py --outputs_dir outputs --out results.csv
"""
import argparse
import csv
import json
from pathlib import Path


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--outputs_dir", default="outputs")
    parser.add_argument("--out", default="results.csv")
    args = parser.parse_args()

    rows = []
    for metrics_path in sorted(Path(args.outputs_dir).glob("*/*/*/test_metrics.json")):
        scheme, model, loss = metrics_path.parts[-4:-1]
        metrics = json.loads(metrics_path.read_text())
        rows.append({"scheme": scheme, "model": model, "loss": loss, **metrics})

    if not rows:
        print(f"No test_metrics.json found under {args.outputs_dir}")
        return

    id_cols = ["scheme", "model", "loss"]
    other_cols = sorted({key for row in rows for key in row if key not in id_cols})

    with open(args.out, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=id_cols + other_cols)
        writer.writeheader()
        writer.writerows(rows)

    print(f"Wrote {len(rows)} rows to {args.out}")


if __name__ == "__main__":
    main()
