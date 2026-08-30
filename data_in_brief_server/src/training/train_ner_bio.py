"""Train bert-base-cased for BIO trait NER with plain (unweighted) cross-entropy.

The whole configuration lives in configs/ (model/bert.yaml + scheme/bio.yaml);
this is a thin entrypoint over common.run_training.

Usage:
    python src/training/train_ner_bio.py --output_dir outputs/bio/bert/baseline
"""
import argparse
from pathlib import Path

from common import run_training

REPO_ROOT = Path(__file__).resolve().parent.parent.parent


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--output_dir", default=str(REPO_ROOT / "outputs" / "bio" / "bert" / "baseline"))
    parser.add_argument("--config_dir", default=str(REPO_ROOT / "configs"))
    parser.add_argument(
        "--force", action="store_true",
        help="retrain even if output_dir already holds a completed run; required "
             "after regenerating bio_tagging/bio_dataset, otherwise the job exits 0 "
             "without training anything",
    )
    args = parser.parse_args()

    run_training(
        output_dir=args.output_dir,
        config_dir=Path(args.config_dir),
        repo_root=REPO_ROOT,
        force=args.force,
    )


if __name__ == "__main__":
    main()
