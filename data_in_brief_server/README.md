# deb_trait_ner_bert

Token-classification NER that extracts animal life-history / trait measurements
(the DEB — Dynamic Energy Budget — trait vocabulary) from species-description
text. The project trains **one configuration**: `bert-base-cased` on the
**BIO**-tagged dataset with the **baseline** strategy: unweighted
cross-entropy (no class or all-`O` reweighting), with label smoothing 0.1 as a
regularizer — see the comment on `loss_fn` in `src/training/common.py`.

## Entity types (20)

Numeric measurements and indices: lengths `Li` / `Lp` / `Lb`, wet weights
`Wwi` / `Wwb` / `Wwp` / `Ww0` / `Wwx`, ages & times `ab` / `am` / `tR` / `tg` /
`tp` / `tx`, plus `T`, `GSI`, `JOi`, `Ri`, `F_R_i`, `N_R_i`. Tagged in BIO
(`B-`/`I-`/`O`); see [bio_tagging/bio_dataset/label_mapping.json](bio_tagging/bio_dataset/label_mapping.json).

The dataset is heavily imbalanced (~60% all-`O` sentences, plus rare classes),
which is why the baseline sets the reference point rather than any reweighting.

## Layout

```
configs/
  model/bert.yaml          # checkpoint + hyperparameters
  scheme/bio.yaml          # dataset paths + label mapping
bio_tagging/
  bio_dataset/             # HF dataset tokenized for bert-base-cased (+ label_mapping.json)
  bio_dataset_split/       # raw train/val/test .jsonl (tokens + biotags)
src/
  training/common.py       # shared training/scoring/decoding logic
  training/train_ner_bio.py# training entrypoint
  evaluation/              # evaluate.py, per_entity_report.py, generate_report.py, aggregate_results.py
  inference/predict.py     # annotate new raw text -> entity spans
inference_tests/           # ner_infer.py + inference.ipynb (quick manual check)
scripts/cache_models.py    # pre-download bert-base-cased on a login node
envs/setup_narval.sh       # build the Narval training venv
slurm/                     # _run.sh + train/bio/train_bert_baseline.sbatch + logs/
outputs/bio/bert/baseline/ # trained model + test_metrics.json + run_info.json
```

## Workflow (Narval / Alliance Canada)

```bash
# 1. one-time: build the venv (login node)
bash envs/setup_narval.sh

# 2. one-time: cache the base checkpoint offline (login node, needs internet)
export HF_HOME=/scratch/$USER/hf_cache
python scripts/cache_models.py

# 3. train (compute node); resubmitting the same script resumes from checkpoint
sbatch slurm/train/bio/train_bert_baseline.sbatch
```

Training writes the checkpoint, `test_metrics.json`, and `run_info.json` to
`outputs/bio/bert/baseline/`. `/scratch` is purged after ~60–90 days of
inactivity — copy `outputs/` to `$HOME` to keep the trained model.

### What the `.out` log shows

Each epoch logs three sections plus best-model tracking (test is an extra
held-out pass run per epoch, for monitoring only — it never affects which
checkpoint is kept, which is chosen on validation F1):

```
Epoch 12/50
------------------------------------------------------------
Train - Loss: 0.0227, P: 0.8627, R: 0.9212, F1: 0.8910, Acc: 0.9932
Val   - Loss: 0.0225, P: 0.8930, R: 0.9565, F1: 0.9236, Acc: 0.9936
Test  - Loss: 0.0230, P: 0.8901, R: 0.9503, F1: 0.9192, Acc: 0.9931
 New best model saved (F1: 0.9236)
```

At the end it prints the final held-out summary and a full **per-entity
precision/recall/F1/support** table. Those per-entity numbers are also saved
into `test_metrics.json` (as `test_precision_<Type>`, `test_recall_<Type>`,
`test_f1_<Type>`, `test_support_<Type>`).

## Evaluate & report

```bash
python src/evaluation/evaluate.py        --model_dir outputs/bio/bert/baseline/final_model
python src/evaluation/generate_report.py --model_dir outputs/bio/bert/baseline/final_model
python src/evaluation/aggregate_results.py --outputs_dir outputs --out results.csv
```

`generate_report.py` writes a per-entity CSV, an entity-type confusion matrix,
an error analysis, and a paper-ready report with a LaTeX table.

## Inference on new text

```bash
python src/inference/predict.py \
    --model_dir outputs/bio/bert/baseline/final_model \
    --input_file new_species_description.txt \
    --output_file predictions.json
```

Add `--threshold 0.9` to trade recall for precision (keep a non-`O` prediction
only when its softmax confidence clears the threshold). For a quick manual
check, open [inference_tests/inference.ipynb](inference_tests/inference.ipynb).

## Current result (test set)

| Model | Scheme | Loss | Precision | Recall | F1 | Token acc |
|-------|--------|------|:---------:|:------:|:--:|:---------:|
| bert-base-cased | BIO | baseline | 0.9304 | 0.9613 | **0.9456** | 0.9950 |
