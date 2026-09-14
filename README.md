# Animalia Dataset Generator

A two-stage pipeline for extracting, classifying, and structuring biological data from the [Add-my-Pet (AmP)](https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/) database, with the goal of generating annotated training data for biological NLP models. The pipeline covers 7,332 species and produces lifecycle diagrams, lexical resources, and annotated text corpora based on Dynamic Energy Budget (DEB) theory.

---

## Repository Structure

```
animalia-data-pipeline-Github/
└── animalia-dataset-generator/
    ├── pet-management/             # Step 1 — Data extraction and normalization notebooks
    ├── concatenated_json/          # Step 1 output — one JSON per species (zero-variate data)
    ├── addmypet_by_class/          # Step 2 — Species grouped by taxonomic class
    ├── addmypet_by_model/          # Step 2 — Species grouped by DEB model
    ├── addmypet_by_model_ah/       # Step 2 — DEB model groups with ah/ab distinction analysis
    ├── addmypet_entities_managment/# Step 2 — Entity management and restructuring notebooks
    ├── class_by_model/             # Step 2 — Cross-reference: taxonomic class × DEB model
    ├── summary_classes/            # Step 2 — Per-class JSON summaries with entity statistics
    ├── summary_no_class/           # Step 2 — Summaries for unclassified species
    ├── life_cycle/                 # Step 2 — Lifecycle generation resources
    │   ├── lifecycle_diagrams/     #   SVG diagrams (one per class × DEB model combination)
    │   ├── lifecycle_markdown/     #   Narrative text descriptions of each lifecycle
    │   ├── lifecycle_json/         #   Structured lexical JSON per class
    │   ├── lifecycle_prompt.md     #   Prompt used to generate lifecycle diagrams
    │   ├── prompt_svg_to_text.md   #   Prompt used to convert SVG diagrams to narrative text
    │   └── prompt_lexique.md       #   Prompt used to generate the biological lexicon
    ├── prompts/                    # Consolidated prompt library
    ├── pars_init/                  # Initial DEB parameter files
    └── data_generation/            # Step 2 output — Ingredients for annotation text generation
        ├── species_data/           #   Copy of concatenated_json + deb_model field added
        ├── entity_statistics/      #   Entity frequency analysis across the full corpus
        ├── lexical_data/           #   Lexical resources per class
        ├── generated_text/         #   Final generated annotation texts
        ├── prompts_batches/        #   Batched prompts sent to DeepSeek
        ├── prompts_to_send/        #   Prompts staged for API submission
        ├── run_api_deepseek/       #   Scripts for DeepSeek API calls
        ├── addmypet/               #   AmP source data copies
        ├── summary_class/          #   Class-level summaries used during generation
        ├── group_batches.ipynb     #   Batch grouping notebook
        ├── split_prompts.ipynb     #   Prompt splitting notebook
        └── text_generation.ipynb   #   Main text generation notebook
```

---

## Pipeline Overview

The pipeline is organized into two sequential stages. Each stage depends on the outputs of the previous one.

```
Stage 1: Raw Data Extraction & Normalization
          └──► concatenated_json/

Stage 2: Taxonomic Classification, Lifecycle Generation & Annotation
          └──► addmypet_by_class/, addmypet_by_model/, summary_classes/,
               life_cycle/, data_generation/
```

---

## Stage 1 — Data Extraction and Normalization

**Notebooks:** [`pet-management/`](animalia-dataset-generator/pet-management/)
**Output:** [`concatenated_json/`](animalia-dataset-generator/concatenated_json/)

This stage processes the raw AmP data archive and produces one clean JSON file per species containing zero-variate DEB parameters.

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
| 9 | **Export to JSON** | Extract zero-variate blocks and serialize each species as a JSON file in [`concatenated_json/`](animalia-dataset-generator/concatenated_json/) |

---

## Stage 2 — Taxonomic Classification, Lifecycle Generation & Annotation

**Notebooks:** [`pet-management/classes_managment.ipynb`](animalia-dataset-generator/pet-management/classes_managment.ipynb), [`pet-management/ah_managment.ipynb`](animalia-dataset-generator/pet-management/ah_managment.ipynb), [`addmypet_entities_managment/`](animalia-dataset-generator/addmypet_entities_managment/), scripts in [`life_cycle/`](animalia-dataset-generator/life_cycle/)
**Input:** [`concatenated_json/`](animalia-dataset-generator/concatenated_json/)
**Output:** [`addmypet_by_class/`](animalia-dataset-generator/addmypet_by_class/), [`addmypet_by_model/`](animalia-dataset-generator/addmypet_by_model/), [`summary_classes/`](animalia-dataset-generator/summary_classes/), [`life_cycle/`](animalia-dataset-generator/life_cycle/), [`data_generation/`](animalia-dataset-generator/data_generation/)

### 2.1 — Taxonomic Classification by DEB Model

**Notebook:** `classes_managment.ipynb`  
**Output:** [`addmypet_by_class/`](animalia-dataset-generator/addmypet_by_class/), [`addmypet_by_model/`](animalia-dataset-generator/addmypet_by_model/)

All 7,332 AmP species are categorized by taxonomic class, then each class is associated with its dominant DEB model (`std`, `abj`, `sbma`, etc.). This produces two parallel directory trees: one organized by taxonomic class, one organized by DEB model.

### 2.2 — Per-Model Entity Summaries

**Notebook:** `classes_managment.ipynb`  
**Output:** [`addmypet_by_model/`](animalia-dataset-generator/addmypet_by_model/) (summary files)

For each DEB model folder, an aggregated summary is generated showing the occurrence count of each biological entity and the total number of species covered.

### 2.3 — Entity Statistics per Class and Model

**Notebook:** `addmypet_entities_managment/entities_managment.ipynb`  
**Output:** [`summary_classes/`](animalia-dataset-generator/summary_classes/)

Entity frequency is computed per model and per taxonomic class in order to determine which life stages and transitions are present in the lifecycle — a prerequisite for lifecycle diagram generation.

### 2.4 — Detection of ah / ab Distinction

**Notebook:** `pet-management/ah_managment.ipynb`  
**Output:** updated JSON files in [`summary_classes/`](animalia-dataset-generator/summary_classes/)

For each DEB model folder, the entity `ah` (age at hatching) is compared against `ab` (age at birth) across all species. If at least one species has `ah ≠ ab`, a boolean field `has_species_with_ah_diff_ab: true` is added to the class summary JSON. This distinction determines whether a hatching stage should appear in the lifecycle diagram.

### 2.5 — Automated Lifecycle Diagram Generation

**Scripts:** [`life_cycle/generate_lifecycles.py`](animalia-dataset-generator/life_cycle/generate_lifecycles.py)  
**Prompt:** [`life_cycle/lifecycle_prompt.md`](animalia-dataset-generator/life_cycle/lifecycle_prompt.md)  
**Output:** [`life_cycle/lifecycle_diagrams/`](animalia-dataset-generator/life_cycle/lifecycle_diagrams/) (SVG files)

Entity statistics and DEB model classifications are combined in a structured prompt to generate SVG lifecycle diagrams. Each diagram represents one taxonomic class under one DEB model — a single class may produce multiple diagrams when multiple DEB models apply.

### 2.6 — Lifecycle Narrative Text Conversion

**Script:** [`life_cycle/generate_markdown.py`](animalia-dataset-generator/life_cycle/generate_markdown.py)  
**Prompt:** [`life_cycle/prompt_svg_to_text.md`](animalia-dataset-generator/life_cycle/prompt_svg_to_text.md)  
**Output:** [`life_cycle/lifecycle_markdown/`](animalia-dataset-generator/life_cycle/lifecycle_markdown/) (Markdown files)

Each SVG lifecycle diagram is converted into a step-by-step narrative text description in chronological order, using a dedicated prompt. One Markdown file is produced per class × DEB model combination.

### 2.7 — Biological Lexicon Generation

**Script:** [`life_cycle/generate_lifecycle_json.py`](animalia-dataset-generator/life_cycle/generate_lifecycle_json.py)  
**Prompt:** [`life_cycle/prompt_lexique.md`](animalia-dataset-generator/life_cycle/prompt_lexique.md)  
**Output:** [`life_cycle/lifecycle_json/`](animalia-dataset-generator/life_cycle/lifecycle_json/) (JSON files)

A dedicated prompt generates a terminological lexicon for each taxonomic class, covering biological entities, life stages, and transitions specific to that class.

### 2.8 — Preparation of the `data_generation/` Folder

**Output:** [`data_generation/species_data/`](animalia-dataset-generator/data_generation/species_data/)

A `data_generation/` directory is created to consolidate all ingredients needed for annotation text generation:

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

**Preparation notebooks:** [`data_generation/text_generation.ipynb`](animalia-dataset-generator/data_generation/text_generation.ipynb), [`data_generation/split_prompts.ipynb`](animalia-dataset-generator/data_generation/split_prompts.ipynb)  
**Execution notebooks:** [`data_generation/run_api_deepseek/`](animalia-dataset-generator/data_generation/run_api_deepseek/) (8 notebooks, one per batch)  
**Consolidation notebook:** [`data_generation/group_batches.ipynb`](animalia-dataset-generator/data_generation/group_batches.ipynb)  
**Prompt:** [`data_generation/prompt_claude.md`](animalia-dataset-generator/data_generation/prompt_claude.md)  
**Output:** [`data_generation/generated_text/`](animalia-dataset-generator/data_generation/generated_text/)

Annotation text generation follows a three-phase process:

**Phase 1 — Prompt construction** (`text_generation.ipynb`)  
For each of the 7,281 valid species, a complete prompt is assembled by combining the species' zero-variate data, its DEB model, the corresponding lifecycle narrative, and the terminological lexicon of its class. Each prompt is saved as an individual JSON file in [`prompts_to_send/`](animalia-dataset-generator/data_generation/prompts_to_send/) with a `"result": null` field awaiting completion.

**Phase 2 — Batch splitting and API calls** (`split_prompts.ipynb` + `run_api_deepseek_batch_*.ipynb` notebooks)  
The 7,281 prompt files are split into **8 batches of ~1,000 species** each (`split_prompts.ipynb`) and distributed into subfolders [`prompts_batches/batch_01/`](animalia-dataset-generator/data_generation/prompts_batches/) through `batch_08/`. A dedicated notebook (`run_api_deepseek_batch_XX.ipynb`) processes each batch independently: it sends prompts one by one to the DeepSeek API (`deepseek-v4-pro`), writes the generated text into the `"result"` field of the corresponding JSON file, and automatically handles retries on failure or rate-limit errors (up to 6 attempts with exponential backoff). A 5-second delay is enforced between API calls.

**Phase 3 — Consolidation** (`group_batches.ipynb`)  
Once all batches are complete, the 7,281 JSON files are gathered into the final [`generated_text/`](animalia-dataset-generator/data_generation/generated_text/) folder. The `"result"` field is renamed to `"generated_text"` for clarity.

### 2.11 — Temperature Enrichment

Temperature data is added to the annotation texts as an additional biological parameter, enriching the training corpus with thermal context for each species.

### 2.12 — Annotation Statistics

**Notebook:** [`data_generation/entity_statistics/entity_statistics.ipynb`](animalia-dataset-generator/data_generation/entity_statistics/)  
**Output:** [`data_generation/entity_statistics/`](animalia-dataset-generator/data_generation/entity_statistics/)

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

---

## Getting Started

1. Clone this repository.
2. Run Stage 1 notebooks in [`pet-management/`](animalia-dataset-generator/pet-management/) in order to produce [`concatenated_json/`](animalia-dataset-generator/concatenated_json/).
3. Run Stage 2 notebooks in sequence: `classes_managment.ipynb` → `ah_managment.ipynb` → `entities_managment.ipynb` → lifecycle scripts → `text_generation.ipynb`.
4. Final annotated texts are available in [`data_generation/generated_text/`](animalia-dataset-generator/data_generation/generated_text/).

---

## NER Dataset (BIO-tagged corpus)

The BIO-tagged NER dataset built from the generated annotation texts (`all_species_bio.jsonl` and its `train` / `validation` / `test` splits) is hosted on HuggingFace rather than tracked in this repository, due to file size:

**[huggingface.co/datasets/Somaya-Jabir/animalia-deb-ner-dataset](https://huggingface.co/datasets/Somaya-Jabir/animalia-deb-ner-dataset)**

> Currently private while the dataset is finalized. It will be made public (with a citable DOI) at submission time.

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

This repository provides a [`CITATION.cff`](CITATION.cff) file. GitHub reads it
automatically and offers a **“Cite this repository”** button in the right-hand
sidebar, with ready-to-copy APA and BibTeX entries.

Plain-text citation:

> Jabir, S. (2026). *Animalia Dataset Generator: a DEB-based pipeline for life
> cycle modelling and biological NER corpus generation* (Version 1.0.0)
> [Data set]. Université Cadi Ayyad.
> https://github.com/sjabirced/animalia-deb-dataset-pipeline

An archived snapshot of the released version, together with a permanent DOI,
will be deposited on Zenodo at publication time. Once available, the DOI is the
preferred way to cite this work, as it points to a fixed, immutable version of
the data rather than to the evolving repository.
