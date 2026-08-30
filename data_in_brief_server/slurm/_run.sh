# Sourced by slurm/train/bio/train_bert_baseline.sbatch — not submitted directly.
# Assumes the enclosing sbatch script was submitted from the repo root.
set -euo pipefail

module purge
# arrow is required for `datasets` (pyarrow dependency, provided only via
# this module on Alliance clusters, not as a pip wheel) — must load before
# activating the venv, not after. Verified via `module spider arrow/24.0.0`
# that StdEnv/2023 is its only prerequisite — no gcc needed.
module load StdEnv/2023 python/3.11 cuda/12.2 cudnn arrow/24.0.0
source "$HOME/envs/deb_ner/bin/activate"

export HF_HOME=/scratch/$USER/hf_cache
export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1
export HF_DATASETS_OFFLINE=1

# Avoid a known HF fast-tokenizer/multiprocessing warning-and-deadlock interaction.
export TOKENIZERS_PARALLELISM=false
# Without this, BLAS/OpenMP libraries can try to use every core on the
# physical node instead of just the ones actually allocated to this job.
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK:-8}
# Reduces GPU memory fragmentation risk on long runs.
export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:512

# Derived from the directory sbatch was submitted from (so nothing here hardcodes
# an absolute path that breaks when the project moves). Requires submitting from
# the repo root: `cd <repo> && sbatch slurm/train/bio/train_bert_baseline.sbatch`.
# Falls back to $PWD if run directly with bash (not via Slurm).
PROJECT_ROOT="${SLURM_SUBMIT_DIR:-$PWD}"
FINAL_OUT="$PROJECT_ROOT/outputs/bio/bert/baseline"
mkdir -p "$FINAL_OUT"

cd "$PROJECT_ROOT"

# Prints a closing banner no matter how the job ends (success, python raising
# an error, OOM) via a trap, rather than capturing $? right after the training
# call — under `set -e`, a non-zero exit there would abort the script before
# any trailing "job complete" code got a chance to run.
finish() {
    local exit_code=$?
    echo ""
    echo "========================================================================"
    echo "JOB COMPLETE: $SLURM_JOB_NAME (Job ID: $SLURM_JOB_ID)"
    echo "End time:   $(date)"
    echo "Exit code:  $exit_code"
    echo "Results:    $FINAL_OUT"
    echo "========================================================================"
}
trap finish EXIT

echo "========================================================================"
echo "JOB: $SLURM_JOB_NAME (Job ID: $SLURM_JOB_ID)"
echo "Model: bert | Scheme: bio | Loss strategy: baseline"
echo "Node: $SLURM_NODELIST"
echo "Start time: $(date)"
echo "========================================================================"

# Write straight to $FINAL_OUT rather than $SLURM_TMPDIR + a copy-back-at-the-
# end step: checkpointing is only once per epoch, so the filesystem cost is
# negligible, and this way a killed/crashed job (time limit, OOM, transient GPU
# error, anything) still leaves every epoch checkpoint it completed on disk
# instead of losing all of it. train_ner_bio.py auto-resumes from the last
# checkpoint here if one exists, so simply resubmitting the same sbatch script
# continues training rather than starting over.
#
# NOTE: PROJECT_ROOT is on /scratch, which the Alliance purges after ~60-90
# days of inactivity (this account has no usable /project space) — once the
# run finishes, copy outputs/ somewhere that won't get purged (e.g. $HOME) so
# the trained model survives.
# --gpu-bind=closest ensures the allocated CPU cores are NUMA-local to the
# assigned GPU — matters on Narval's multi-GPU (4x A100) nodes for host<->device
# transfer speed.
# TRAIN_EXTRA_ARGS forwards flags to the training entrypoint. sbatch exports the
# submitting environment by default, so this reaches the compute node:
#     TRAIN_EXTRA_ARGS=--force sbatch slurm/train/bio/train_bert_baseline.sbatch
# --force is what you need after regenerating bio_tagging/bio_dataset: without
# it, a $FINAL_OUT that already holds test_metrics.json makes the job exit 0
# having trained nothing. Deliberately unquoted so multiple flags word-split.
srun --ntasks=1 --cpus-per-task="${SLURM_CPUS_PER_TASK}" --gpus-per-task=1 --gpu-bind=closest \
    python src/training/train_ner_bio.py \
    --output_dir "$FINAL_OUT" ${TRAIN_EXTRA_ARGS:-}
