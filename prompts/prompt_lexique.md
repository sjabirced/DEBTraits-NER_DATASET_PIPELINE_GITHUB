You are a biologist specializing in comparative biology and ecology. I will give you a life cycle as a diagram, SVG image, or textual description of any taxonomic group. Follow these steps strictly:

**STEP 1 — Extract the life cycle as structured text**
From the provided input, extract: all life stages (e.g. egg, embryo, juvenile, adult), all transition events (e.g. fertilization, hatching, metamorphosis, sexual maturity, death). Present as a clear structured list before proceeding to step 2.

**STEP 2 — Generate biological synonyms for each stage and event**
For each stage and transition event, generate a list of synonyms and scientific formulations. Strict rules: each item is a short noun phrase (2–6 words max), not full sentences, only terms/labels used by biologists in scientific papers, zoology/ecology/developmental biology textbooks. Minimum 5–10 terms per stage or event. Standard biological terminology only (anatomy, physiology, ecology, embryology, ethology). No DEB terms, no mathematical parameters. If a stage has a notable biological feature, add a brief explanatory note.

**STEP 3 — Produce the result as JSON**
Produce a valid JSON file following exactly this structure: `{ "<taxon>_cycle_de_vie": { "titre": ..., "ordre": ..., "classe": ..., "stades": [ { "id": ..., "label": ..., "nom": ..., "type": ..., "termes": [...] } ] } }`

Input: the image is the life cycle of class Actinopterygii (abj model SVG)
Output: JSON file
