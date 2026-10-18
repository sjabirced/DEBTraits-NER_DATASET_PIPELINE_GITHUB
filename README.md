# DEBTraits-NER: annotated corpus and construction pipeline

An annotated corpus for named-entity recognition (NER) of Dynamic Energy Budget (DEB) life-history traits, built from the [Add-my-Pet (AmP)](https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/) database, together with the pipeline that produced it. The corpus covers 7,281 species across 54 taxonomic classes and ten DEB models, and comprises 191,337 sentences, 6,153,800 tokens and 119,530 annotated mentions of 20 DEB life-history traits, with species-disjoint training, validation and test splits.

The release also contains the AmP source records, the life cycles and biological lexica of the 67 class × DEB-model pairings, and the notebooks, scripts and prompts used to generate and verify the corpus.

---

## Repository Structure

```
DEBTraits-NER_v1.0.0/
├── concatenated_json/          # AmP source records, one JSON per species (7,332)
├── mydata/                     # AmP mydata_*.m source files (7,332)
├── pars_init/                  # AmP parameter-initialisation files (7,332)
├── addmypet_entries/           # AmP entries, unzipped, one folder per species
├── addmypet_entries_zip/       # AmP entries as downloaded, one ZIP per species (7,332)
├── addmypet_by_class/          # Source records grouped by taxonomic class (54)
├── addmypet_by_model/          # Retained class × DEB-model pairings (67)
├── addmypet_by_model_ah/       # Variant carrying the age-at-hatching field
├── class_by_model/             # All class × DEB-model pairings (78)
├── pet-management/             # Class and DEB-model assignment notebooks
├── addmypet_entities_managment/# Entity-symbol harmonisation notebook
├── life_cycle/                 # Biological base: scripts and prompts
│   ├── lifecycle_diagrams/     #   One life-cycle diagram per pairing (67)
│   ├── lifecycle_json/         #   One lexicon per pairing (67)
│   ├── lifecycle_markdown/     #   Stage-and-transition narratives (67)
│   ├── summary_by_model/       #   Per-pairing summaries (67)
│   ├── lifecycle_prompt.md     #   Prompt used to generate lifecycle diagrams
│   ├── prompt_lexique.md       #   Prompt used to generate the biological lexicon
│   └── prompt_svg_to_text.md   #   Prompt used to convert SVG diagrams to narrative text
├── data-generation/            # Prompts, batches and notebooks for text generation
├── data_verification/          # Verification passes and audit reports
├── verification_annotation/    # Deterministic span audit and correction trail
├── data_annotation/
│   ├── all_species_json_final_dataset/  # THE CORPUS: 7,281 records with inline [entity = value unit]
│   ├── bio_annotation_final_dataset/    # Per-species BIO files (7,281)
│   ├── animalia_dataset/                # Full-corpus JSONL and train / val / test splits (ZIP)
│   └── data_annotation_notebook/        # Conversion notebooks
├── data_in_brief_server/       # Tokenised dataset (ZIP), training and inference code
├── summary_classes/            # Per-class trait summaries
├── summary_no_class/           # Per-pairing trait summaries
├── CITATION.cff, LICENSE, LICENSE-DATA, requirements.txt
└── README.md, pipeline.md
```

---

## Pipeline Overview

The pipeline is organized into two sequential stages. Each stage depends on the outputs of the previous one.

```
Stage 1: Raw Data Extraction & Normalization
          └──► concatenated_json/

Stage 2: Taxonomic Classification, Lifecycle Generation & Annotation
          └──► addmypet_by_class/, addmypet_by_model/, summary_classes/,
               life_cycle/, data-generation/
```

---

## Stage 1 — Data Extraction and Normalization

**Input:** [`mydata/`](mydata/), [`pars_init/`](pars_init/)  
**Output:** [`concatenated_json/`](concatenated_json/)

This stage processes the raw AmP data archive and produces one clean JSON file per species containing zero-variate DEB parameters. The code of this stage is not included in the release; its inputs (`mydata/`, `pars_init/`) and its outputs (`concatenated_json/`) are, so that every record can be checked against the file it was read from.

### Steps

| # | Action | Detail |
|---|--------|--------|
| 1 | **Download source archive** | Download `entries_zip`, containing one ZIP folder per species (7,332 species total) |
| 2 | **Unzip all archives** | Extract all ZIPs into a single flat directory of species folders |
| 3 | **Extract `mydata` files** | Collect all `mydata_*.m` MATLAB source files across species |
| 4 | **Extract taxonomy** | Parse taxonomy from each `mydata` file; export to Excel, then convert to JSON |
| 5 | **Locate zero-variate data** | Extract text between `%zero-variate data` and `%univariate data` markers |
| 6 | **Normalize heterogeneous files** | Some files use `%%set data` instead of `%zero-variate data` — detect these and insert the missing marker to unify the structure |
| 7 | **Normalize univariate markers** | Detect spelling variants (`Univariate data`, `Uni-variate data`, `univariate data`) and standardize them to `%univariate data` |
| 8 | **Concatenate all files** | After normalization, all files contain both expected markers |
| 9 | **Export to JSON** | Extract zero-variate blocks and serialize each species as a JSON file in [`concatenated_json/`](concatenated_json/) |

---

## Stage 2 — Taxonomic Classification, Lifecycle Generation & Annotation

**Notebooks:** [`pet-management/classes_managment.ipynb`](pet-management/classes_managment.ipynb), [`pet-management/ah_managment.ipynb`](pet-management/ah_managment.ipynb), [`addmypet_entities_managment/`](addmypet_entities_managment/), scripts in [`life_cycle/`](life_cycle/)
**Input:** [`concatenated_json/`](concatenated_json/)
**Output:** [`addmypet_by_class/`](addmypet_by_class/), [`addmypet_by_model/`](addmypet_by_model/), [`summary_classes/`](summary_classes/), [`life_cycle/`](life_cycle/), [`data-generation/`](data-generation/)

### 2.1 — Taxonomic Classification by DEB Model

**Notebook:** `classes_managment.ipynb`  
**Output:** [`addmypet_by_class/`](addmypet_by_class/), [`addmypet_by_model/`](addmypet_by_model/)

All 7,332 AmP species are categorized by taxonomic class, then each class is associated with its dominant DEB model (`std`, `abj`, `sbma`, etc.). This produces two parallel directory trees: one organized by taxonomic class, one organized by DEB model.

### 2.2 — Per-Model Entity Summaries

**Notebook:** `classes_managment.ipynb`  
**Output:** [`addmypet_by_model/`](addmypet_by_model/) (summary files)

For each DEB model folder, an aggregated summary is generated showing the occurrence count of each biological entity and the total number of species covered.

### 2.3 — Entity Statistics per Class and Model

**Notebook:** `pet-management/entities_managment.ipynb`  
**Output:** [`summary_classes/`](summary_classes/), [`summary_no_class/`](summary_no_class/), [`life_cycle/summary_by_model/`](life_cycle/summary_by_model/)

Entity frequency is computed per model and per taxonomic class in order to determine which life stages and transitions are present in the lifecycle — a prerequisite for lifecycle diagram generation.

### 2.4 — Detection of ah / ab Distinction

**Notebook:** `pet-management/ah_managment.ipynb`  
**Output:** updated JSON files in [`summary_classes/`](summary_classes/)

For each DEB model folder, the entity `ah` (age at hatching) is compared against `ab` (age at birth) across all species. If at least one species has `ah ≠ ab`, a boolean field `has_species_with_ah_diff_ab: true` is added to the class summary JSON. This distinction determines whether a hatching stage should appear in the lifecycle diagram.

### 2.5 — Automated Lifecycle Diagram Generation

**Scripts:** [`life_cycle/generate_lifecycles.py`](life_cycle/generate_lifecycles.py)  
**Prompt:** [`life_cycle/lifecycle_prompt.md`](life_cycle/lifecycle_prompt.md)  
**Output:** [`life_cycle/lifecycle_diagrams/`](life_cycle/lifecycle_diagrams/) (SVG files)

Entity statistics and DEB model classifications are combined in a structured prompt to generate SVG lifecycle diagrams. Each diagram represents one taxonomic class under one DEB model — a single class may produce multiple diagrams when multiple DEB models apply.

### 2.6 — Lifecycle Narrative Text Conversion

**Script:** [`life_cycle/generate_markdown.py`](life_cycle/generate_markdown.py)  
**Prompt:** [`life_cycle/prompt_svg_to_text.md`](life_cycle/prompt_svg_to_text.md)  
**Output:** [`life_cycle/lifecycle_markdown/`](life_cycle/lifecycle_markdown/) (Markdown files)

Each SVG lifecycle diagram is converted into a step-by-step narrative text description in chronological order, using a dedicated prompt. One Markdown file is produced per class × DEB model combination.

### 2.7 — Biological Lexicon Generation

**Script:** [`life_cycle/generate_lifecycle_json.py`](life_cycle/generate_lifecycle_json.py)  
**Prompt:** [`life_cycle/prompt_lexique.md`](life_cycle/prompt_lexique.md)  
**Output:** [`life_cycle/lifecycle_json/`](life_cycle/lifecycle_json/) (JSON files)

A dedicated prompt generates a terminological lexicon for each taxonomic class, covering biological entities, life stages, and transitions specific to that class.

### 2.8 — Preparation of the `data-generation/` Folder

**Output:** [`data-generation/species_data/`](data-generation/species_data/)

A `data-generation/` directory is created to consolidate all ingredients needed for annotation text generation:

- **`species_data/`** is a copy of `concatenated_json/` with one addition: each species JSON file is enriched with a `"deb_model"` field (e.g., `"deb_model": "abj"`) indicating the DEB model assigned to that species. This field is used downstream to select the appropriate lexicon during text generation.

Example:
```json
{
  "deb_model": "abj",
  ...
}
```

### 2.9 — JSON Entity Restructuring

**Notebook:** `addmypet_entities_managment/entities_managment.ipynb`

Species JSON files are restructured so that entities are grouped by shared suffix (e.g., all `_0`, `_f`, `_m` variants are grouped together). This normalization simplifies downstream processing during prompt construction.

### 2.10 — Annotation Text Generation via DeepSeek

**Preparation notebooks:** [`data-generation/text_generation.ipynb`](data-generation/text_generation.ipynb), [`data-generation/split_prompts.ipynb`](data-generation/split_prompts.ipynb)  
**Execution notebooks:** [`data-generation/run_api_deepseek/`](data-generation/run_api_deepseek/) (20 notebooks, one per batch, plus two regeneration notebooks)  
**Consolidation notebook:** [`data-generation/group_batches.ipynb`](data-generation/group_batches.ipynb)  
**Prompt:** [`data-generation/prompt_claude.md`](data-generation/prompt_claude.md)  
**Output:** `data-generation/generated_text/` (not included in the release; the verified texts are in [`data_annotation/all_species_json_final_dataset/`](data_annotation/all_species_json_final_dataset/))

Annotation text generation follows a three-phase process:

**Phase 1 — Prompt construction** (`text_generation.ipynb`)  
For each of the 7,281 valid species, a complete prompt is assembled by combining the species' zero-variate data, its DEB model, the corresponding lifecycle narrative, and the terminological lexicon of its class. Each prompt is saved as an individual JSON file in [`prompts_to_send/`](data-generation/prompts_to_send/) with a `"result": null` field awaiting completion.

**Phase 2 — Batch splitting and API calls** (`split_prompts.ipynb` + `run_api_deepseek_batch_*.ipynb` notebooks)  
The 7,281 prompt files are split into **20 batches** (`split_prompts.ipynb`), released as [`prompts_batches_20/batch_01.zip`](data-generation/prompts_batches_20/) through `batch_20.zip`. A dedicated notebook (`run_api_deepseek_batch_XX.ipynb`) processes each batch independently: it sends prompts one by one to the DeepSeek API (`deepseek-v4-pro`), writes the generated text into the `"result"` field of the corresponding JSON file, and automatically handles retries on failure or rate-limit errors (up to 6 attempts with exponential backoff). A 5-second delay is enforced between API calls.

**Phase 3 — Consolidation** (`group_batches.ipynb`)  
Once all batches are complete, the 7,281 JSON files are gathered into the final `generated_text/` folder. The `"result"` field is renamed to `"generated_text"` for clarity.

### 2.11 — Temperature Enrichment

Temperature data is added to the annotation texts as an additional biological parameter, enriching the training corpus with thermal context for each species.

### 2.12 — Annotation Statistics

**Notebook:** [`data-generation/entity_statistics/entity_statistics.ipynb`](data-generation/entity_statistics/)  
**Output:** [`data-generation/entity_statistics/`](data-generation/entity_statistics/)

After generation, entity occurrence frequencies are computed across the full annotation corpus. This step evaluates the distribution and coverage of biological entities in the training data and guides entity selection for model training.

Key outputs:
- `class_entity_groups.json` — entity groupings by class
- `per_species_17_classes.png` — distribution chart across 17 taxonomic classes

---

## Dependencies

- Python 3.x
- Jupyter Notebook
- Standard scientific stack: `pandas`, `numpy`, `matplotlib`
- DeepSeek API (for annotation generation — Step 2.10)
- An LLM API (for lifecycle and lexicon generation — Steps 2.5–2.7)
- Pinned package versions: [`requirements.txt`](requirements.txt)

---

## Getting Started

1. Download and unzip this archive.
2. Start from [`concatenated_json/`](concatenated_json/), the output of Stage 1 (the Stage 1 code is not included).
3. Run Stage 2 notebooks in sequence: `classes_managment.ipynb` → `ah_managment.ipynb` → `entities_managment.ipynb` → lifecycle scripts → `text_generation.ipynb`.
4. The verified annotated corpus is in [`data_annotation/all_species_json_final_dataset/`](data_annotation/all_species_json_final_dataset/).

---

## NER Dataset (BIO-tagged corpus)

The BIO-tagged NER dataset built from the verified corpus is included in this release as ZIP archives:

- [`data_annotation/animalia_dataset/all_species_bio.jsonl.zip`](data_annotation/animalia_dataset/) — full corpus, one sentence per line
- [`data_annotation/animalia_dataset/bio_dataset_split.zip`](data_annotation/animalia_dataset/) — species-disjoint `train` / `validation` / `test` splits
- [`data_in_brief_server/bio_tagging/bio_dataset.zip`](data_in_brief_server/bio_tagging/) — tokenised `DatasetDict` (`bert-base-cased`, 41 labels) used by the reference baseline

---

## License

This repository is released under a dual license, reflecting the two natures of
its content:

| Content | License | File |
| --- | --- | --- |
| Source code — Python scripts (`*.py`) and Jupyter notebooks (`*.ipynb`) | MIT | [`LICENSE`](LICENSE) |
| Data — JSON files, lifecycle diagrams, lexical resources, annotation texts, NER corpus, figures | [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) | [`LICENSE-DATA`](LICENSE-DATA) |

Copyright (c) 2026 Somaya Jabir, Université Cadi Ayyad.

Reuse of the data requires attribution. If you use this dataset or pipeline in
your research, please cite the associated article and this repository.

### Source data

The records processed by this pipeline originate from the
[Add-my-Pet (AmP)](https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/) collection.
The license above covers the contributions of the authors of this repository —
extraction, normalization, classification, life cycle modelling, lexical
resources and generated corpora. The underlying AmP entries remain subject to
the terms of the AmP portal and must be cited as the original source.

---

## How to Cite

This repository provides a [`CITATION.cff`](CITATION.cff) file with the
citation metadata.

Plain-text citation:

> Jabir, S., El Alaoui Elabdallaoui, H., El Hassan, A., & Pecquerie, L. (2026).
> *DEBTraits-NER: annotated corpus and construction pipeline* (Version 1.0.0)
> [Data set]. Zenodo.

This version is archived on Zenodo. Its permanent DOI, given on the Zenodo
record, is the preferred way to cite this work, as it points to a fixed,
immutable version of the data.
