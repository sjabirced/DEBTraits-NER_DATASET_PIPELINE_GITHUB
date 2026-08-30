### STAGE 1 — Extraction & Normalization

**Folder:** `pet-management/` → **output:** `concatenated_json/` (one JSON per species)

1. Download `entries_zip` (one zip per species) and unzip into a flat folder
2. Collect every `mydata_*.m` MATLAB file
3. Parse **taxonomy** from each file (→ Excel → JSON)
4. Extract the **zero-variate data** block (between `%zero-variate data` and `%univariate data`)
5. Normalize the messy files (some use `%%set data`; fix spelling variants of `univariate`)
6. Serialize each species → one clean JSON in `concatenated_json/`

### STAGE 2 — Classification, Lifecycle & Lexicon

**Folders:** `addmypet_by_class/`, `addmypet_by_model/`, `summary_classes/`, `life_cycle/`

1. **Classify** every species by taxonomic class, then by **DEB model** (`std`, `abj`, `sbma`…) → `addmypet_by_class/`, `addmypet_by_model/`
2. **Entity statistics** per class/model (`addmypet_entities_managment/`) → `summary_classes/`
3. **ah/ab detection** (`ah_managment.ipynb`): does hatching ≠ birth? adds `has_species_with_ah_diff_ab` — decides if a hatching stage appears in the lifecycle
4. **Lifecycle diagrams** (`life_cycle/generate_lifecycles.py`) → SVG per class×model (prompt pass for claude desktop in lifecycle_prompt.md file) -> output lifecycle_diagrams folder
5. **SVG → narrative text** (prompt in prompt_svg_to_text.md`generate_markdown.py`) → `lifecycle_markdown/` ->input lifecycle_diagrams folder -> output lifecycle_markdown folder
6. **Biological lexicon** (prompt in prompt_lexique.md`generate_lifecycle_json.py`) → `lifecycle_json/`-> input lifecycle_markdown folder -> output lifecycle_json folder

### STAGE 3 — Data generation — steps in order

1- Run `text_generation.ipynb` on the input folders `species_data/` + `lexical_data/` and the prompt file `prompt_claude.md` to produce the output folder `prompts_to_send/` (one prompt JSON per species, with a `result: null` field).

2- Run `split_prompts.ipynb` on the input folder `prompts_to_send/` to produce the output folder `prompts_batches_20/` (split into `batch_01/` … `batch_20/`).

3- Run `run_api_deepseek/run_api_deepseek_batch_01…20.ipynb` on the input folder `prompts_batches_20/batch_XX/`; each notebook sends its batch to the DeepSeek API and fills the `result` field in place (the prompt is inside each JSON file, so no `.md` prompt here).

6- Run `group_batches.ipynb` on the input folder `prompts_batches_20/` to produce the output folder `generated_text/` (renaming `result` → `generated_text`).

### STAGE 4 — Data Verification — steps in order

1- Run `run_verification_deepseek/run_verification_deepseek_batch_01…20.ipynb` on the input folder `prompts_batches_20/` using the prompt `verif_prompts/prompt_verification.md`; it adds a `verification` field to each file in place (no new output folder).

2- Run `prepare_reverif_batches.ipynb` on the input folder `prompts_batches_20/` to produce the output folder `prompts_batches_20_reverif/`.

3- Run `sort_batches_reprod_annot.ipynb` on the input folder `prompts_batches_20_reverif/` to produce the output folder `sorted_batches_20_reprod_annot/` (split into `with_reprod_annot/` and `without_reprod_annot/`).

4- Run `sort_by_verdict.ipynb` on the input folder `sorted_batches_20_reprod_annot/` (using `species_by_verdict.json`); it creates verdict sub-folders inside that same folder.

5- Run `extract_reprod_annot_summary.ipynb` on the input folder `sorted_batches_20_reprod_annot/`; it writes a `reprod_annot_summary.json` file inside each batch.

6- Run `build_fixed_batches.ipynb` on the input folders `sorted_batches_20_reprod_annot/` + `../../data-generation/species_data/` to produce the output folder `fixed_batches_20_sorted_GSI/`. j'ai renommé manuellement le dossier `fixed_batches_20_sorted_GSI` par `fixed_batches_20_GSI`

7- dans claude code desktop et j'ai executer le prompt de gsi_generation_prompt.md readt to see the output ajouter le fichier gsi_audit.json fichier pour chaque specie folder

8- copier le dossier `fixed_batches_20_GSI` dans le dossier  fixed_batches_20_GSI_all_entities appliquer par la suite le prompt de batch_ner_audit_prompt.md sur le `_verified`.json et generer le ficiher _verified_audit.json

9- Run `build_verified_gsi_files.ipynb` on the input folder `fixed_batches_20_GSI_all_entities/`; it writes `*_verified.json` files in place.

10- Run `replace_still_needs_review_species.ipynb` on the input folders `fixed_batches_20_GSI_all_entities/` + `needs_text_regeneration/` + `../../data-generation/species_data/`; it replaces the reviewed species folders in place.

11- Run `extract_corrected_texts.ipynb` on the input folders `fixed_batches_20_GSI_all_entities/needs_text_regeneration_review/` + `../../data-generation/species_data/` to produce slimmed-down JSON files.

12- Run `group_batches.ipynb` on the input folder`final_batches_20/` to produce the final output folder all_species_json folder.

### Optional / helper notebooks (not part of the main chain)

13- Run `annotation_entity_statistics.ipynb` on `all_species_json/` to produce `all_species_json_top20/`.

### STAGE 5 — Data Annotation — steps in order

**BIO track**

1- Run `data_annotation_notebook/bio_annotation_all_species.ipynb` on the input folder `all_species_json_final/` to produce the output folder `bio_annotations/`, then it combines them into `animalia_dataset/all_species_bio.jsonl`.

2- Run `data_annotation_notebook/bio_train_val_test_split.ipynb` on the input file `animalia_dataset/all_species_bio.jsonl` to produce the output folder `animalia_dataset/bio_dataset_split/` (train/val/test `.jsonl`).

3- Run `data_annotation_notebook/bio_hf_dataset_prep.ipynb` on the input folder `animalia_dataset/bio_dataset_split/` to produce the output folder `bio_hf_ready/` (tokenized HuggingFace datasets).

**BILOU track**

4- Run `data_annotation_notebook/bilou_annotation_all_species.ipynb` on the input folder `all_species_json_final/` to produce the output folder `bilou_annotations/`, then it combines them into `animalia_dataset/all_species_bilou.jsonl`.

5- Run `data_annotation_notebook/bilou_train_val_test_split.ipynb` on the input folder `bilou_annotations/` to produce the output folder `bilou_dataset_split/` (train/val/test `.jsonl`).

6- Run `data_annotation_notebook/bilou_hf_dataset_prep.ipynb` on the input folder `bilou_dataset_split/` to produce the output folder `bilou_hf_ready/` (tokenized HuggingFace datasets).
