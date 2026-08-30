#!/bin/bash
#SBATCH --account=def-aboz02
#SBATCH --job-name=bert_bio_baseline_reg
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:a100:1
#SBATCH --cpus-per-task=8
#SBATCH --mem=48G
#SBATCH --time=08:00:00
#SBATCH --output=slurm/logs/%x-%j.out
#SBATCH --error=slurm/logs/%x-%j.err

################################################################################
# BERT + BIO + BASELINE — 2e-5 + strong-regularization variant
################################################################################
# The single training run for this project: a general-purpose (non-domain-
# adapted) English BERT on the BIO-tagged trait dataset, with no correction for
# the ~60% all-O sentences or the heavy rare-entity-type imbalance (GSI, Wwx,
# Ww0 vs T, N_R_i, F_R_i).
#
# KEY FEATURES:
#   - bert-base-cased, standard WordPiece tokenizer
#   - Cross-entropy + label smoothing 0.1
#   - LR 2e-5, dropout 0.3, weight decay 0.2 (stacked regularization to
#     shrink the train/val gap), up to 50 epochs (early-stopping patience 10)
#
# MUST be submitted from the repo root so $SLURM_SUBMIT_DIR points there:
#   cd <repo root> && sbatch slurm/train/bio/train_bert_baseline.sbatch
# Resubmitting the same script resumes from the last epoch checkpoint.
################################################################################

source "$SLURM_SUBMIT_DIR/slurm/_run.sh"
