"""Run on a Narval LOGIN node (has internet) before submitting the training job.

Compute nodes have no internet access, so the base checkpoint used by a Slurm
job must already be on disk. This downloads bert-base-cased once into HF_HOME.
Prefer a /project path if your account has one (backed up, never purged); this
account's HF_HOME is on /scratch instead (see slurm/_run.sh), which the
Alliance purges after ~60-90 days of inactivity, so re-run this after a long
gap if the training job starts failing to find the cached model. The training
job itself sets HF_HUB_OFFLINE=1 and TRANSFORMERS_OFFLINE=1 so it never tries
to reach the Hub at runtime.
"""
import os

# Must be set before huggingface_hub is imported (it's read once into a module
# constant at import time). Works around a current HF Hub bug where the new
# Xet transfer backend 404s on the xet-read-token endpoint for popular repos
# (bert-base-cased included) — this forces the classic HTTP downloader instead.
os.environ.setdefault("HF_HUB_DISABLE_XET", "1")

from huggingface_hub import snapshot_download  # noqa: E402

MODELS = [
    "bert-base-cased",
]

if not os.environ.get("HF_HOME"):
    raise SystemExit("Set HF_HOME (e.g. /scratch/$USER/hf_cache) before running this script.")

# Deliberately not passing cache_dir= here: huggingface_hub resolves it from
# HF_HOME as "$HF_HOME/hub" internally, and AutoTokenizer/AutoModel.from_pretrained()
# do the same resolution at training time with no override either (see
# slurm/_run.sh — only HF_HOME is set, not HF_HUB_CACHE). Passing cache_dir=HF_HOME
# explicitly would skip that "/hub" step and download one directory level too
# high, so the training job's from_pretrained() looks in $HF_HOME/hub, finds
# nothing, and fails even though the files are on disk. Letting both sides derive
# the path from HF_HOME alone keeps them in sync.
for repo_id in MODELS:
    print(f"Caching {repo_id} -> {os.environ['HF_HOME']}/hub")
    snapshot_download(repo_id=repo_id)

print("Done. Set HF_HUB_OFFLINE=1 and TRANSFORMERS_OFFLINE=1 in your job scripts from now on.")
