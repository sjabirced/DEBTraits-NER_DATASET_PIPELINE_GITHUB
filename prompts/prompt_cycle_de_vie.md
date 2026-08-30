I have a folder `std_2/` containing 10 JSON files, one per taxonomic class of the Animalia kingdom (e.g. `summary_Aves.json`, etc.).

For each JSON file in this folder, apply the following task independently:

Read the file and generate a timeline schema describing the main life stages and transitions for the corresponding class. The output must be a single SVG file saved as `classes_svg/<ClassName>.svg`, where `<ClassName>` is the class name extracted from the filename (e.g. `summary_Actinopterygii.json` → `classes_svg/Actinopterygii.svg`).

The timeline must be represented graphically in SVG format:

* Below the timeline line, use real-life cycle terminology for both life stages and transitions.
* Above the timeline, use DEB model terminology.

The DEB model associated with each class must first be identified from the JSON file:

* If the DEB model is `abj`, then the timeline must obligatorily include the stages B, J, P, and M, corresponding respectively to `ab`, `aj`, `ap`, and `am`.
* Otherwise, if the DEB model is `std`, then the timeline must obligatorily include the stages B, P, and M, corresponding respectively to `ab`, `ap`, and `am`.
* Otherwise, if the DEB model is `abp`, then the timeline must obligatorily include the stages B, P, and M, corresponding respectively to `ab`, `ap`, and `am`. Since reproduction is asexual, stage P marks the onset of budding or parthenogenesis rather than sexual maturity.
* Otherwise, if the DEB model is `stf`, then the timeline must obligatorily include the stages B, P, and M, corresponding respectively to `ab`, `ap`, and `am`. Since development is viviparous, stage B corresponds to live birth (`tb`) rather than hatching, and the embryonic phase occurs in utero via placental energy transfer.
* Otherwise, if the DEB model is `stx`, then the timeline must obligatorily include the stages G, P, and M, corresponding respectively to `ab`, `ax`, `ap`, `ag`, and `am`. Stage X (`ax`) marks weaning (`tx`), that is, the end of maternal milk dependence. Stage G (`ag`) corresponds to the onset of gestation in the adult. Both stages are unique to this model.

The timeline must start at T0 and end at M.
Each JSON file also contains statistics about entities present across species within the class. The previously mentioned mandatory stages must always be included. In addition, the remaining entities must be analyzed, and if an entity is present in more than 30% of the species, it must also be included in the timeline.

Process all 10 JSON files one by one. For each one, save the result as a standalone SVG file in the `classes_svg/` folder. The SVG file must contain only the SVG code, with no additional text, no explanations, and no comments.
