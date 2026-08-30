#!/bin/bash
# Run ONCE on a Narval LOGIN node to build the training virtualenv.
# Usage: bash envs/setup_narval.sh
set -euo pipefail

cd "$(dirname "$0")/.."

# Slurm opens --output/--error files when a job starts, before any script
# command runs, so this directory must already exist — sbatch fails immediately
# otherwise.
mkdir -p slurm/logs

module purge
# Confirm these are still the current defaults with `module spider python` —
# Alliance rotates StdEnv versions periodically.
#
# arrow is required for `datasets` (it depends on pyarrow, which Alliance
# provides only via this module, not as a normal pip wheel — trying to
# `pip install datasets` without it fails with a dummy "pyarrow_noinstall"
# package that explains this). Verified via `module spider arrow/24.0.0`:
# its only prerequisite is StdEnv/2023 (already loaded below) — no gcc
# needed, despite what some older reference scripts assume. The module must
# be loaded BEFORE the virtualenv is activated below, not after — loading it
# afterward doesn't take effect correctly. datasets requires pyarrow>=21.0.0,
# so re-check `module spider arrow` for a newer version if this one is ever
# retired from the module system.
module load StdEnv/2023 python/3.11 cuda/12.2 cudnn arrow/24.0.0

ENV_DIR="$HOME/envs/deb_ner"
virtualenv --no-download "$ENV_DIR"
source "$ENV_DIR/bin/activate"

pip install --no-index --upgrade pip

# Run `avail_wheels numpy torch transformers datasets accelerate seqeval pyyaml`
# first and adjust package names/versions below if something isn't in the
# wheelhouse. numpy is listed explicitly rather than relying on it coming in
# as a transitive dependency of torch/transformers/datasets.
#
# Installed one at a time rather than as one combined `pip install a b c`
# line: if any single package fails to resolve in the wheelhouse, a combined
# install can fail (and under `set -e`, abort this whole script) without
# installing *any* of them — which happened in practice and was confusing to
# diagnose after the fact, since the venv silently ended up with none of
# these packages rather than "all but the failing one". One at a time, a
# failure points at exactly which package is the problem.
pip install --no-index numpy
pip install --no-index torch
pip install --no-index transformers
pip install --no-index datasets
pip install --no-index accelerate
pip install --no-index seqeval
pip install --no-index pyyaml

echo "Verifying the environment actually has everything importable..."
python -c "
import numpy, torch, transformers, datasets, accelerate, seqeval, yaml
print('numpy', numpy.__version__)
print('torch', torch.__version__)
print('transformers', transformers.__version__)
print('datasets', datasets.__version__)
print('accelerate', accelerate.__version__)
print('seqeval OK')
print('pyyaml OK')
"

echo "Environment built at $ENV_DIR"
echo "Activate in future sessions with: source $ENV_DIR/bin/activate"
