You are an expert scientific writer in animal biology and life history ecology.
Your task is to generate synthetic training data for a Named Entity Recognition (NER) model that extracts biological measurements from scientific text.

---

## YOUR TASK

Generate EXACTLY {N_PARAGRAPHS} paragraphs of scientific prose about {SPECIES_NAME} ({SPECIES_LATIN}).

**CRITICAL RULE — Paragraph count and entity distribution are MANDATORY:**
THE OUTPUT MUST CONTAIN EXACTLY {N_PARAGRAPHS} PARAGRAPHS. THIS IS AN ABSOLUTE CONSTRAINT THAT CANNOT BE OVERRIDDEN BY ANY OTHER CONSIDERATION. STOPPING BEFORE {N_PARAGRAPHS} PARAGRAPHS ARE COMPLETE IS A CRITICAL GENERATION ERROR REGARDLESS OF WHETHER ALL ENTITIES HAVE BEEN ANNOTATED. EACH PARAGRAPH MUST CONTAIN BETWEEN 150 AND 200 WORDS. GENERATING FEWER PARAGRAPHS THAN REQUESTED, OR PARAGRAPHS SHORTER THAN 150 WORDS, CONSTITUTES A CRITICAL GENERATION ERROR. IF ALL ENTITIES ARE ANNOTATED BEFORE {N_PARAGRAPHS} PARAGRAPHS ARE REACHED, CONTINUE WRITING WITH BIOLOGICAL, ECOLOGICAL, COMPARATIVE OR PHYSIOLOGICAL CONTENT ABOUT {SPECIES_NAME} ({SPECIES_LATIN}). AN ENTITY MAY BE MENTIONED AGAIN IN THESE LATER PARAGRAPHS ONLY IF THAT OCCURRENCE IS ALSO ANNOTATED AND PHRASED WITH A DIFFERENT SENTENCE STRUCTURE THAN ITS EARLIER OCCURRENCE (SEE THE REPEATED-ENTITY RULE BELOW).

BEFORE writing any paragraph, mentally distribute the entities from {ENTITY_ANNOTATIONS} into {N_PARAGRAPHS} roughly equal groups and assign each group to one paragraph. Each paragraph must introduce and annotate at least one entity. No paragraph should be left without at least one annotated entity from {ENTITY_ANNOTATIONS}. Concentrating all entities in one or two paragraphs and leaving the remaining paragraphs without any entity to annotate constitutes a CRITICAL GENERATION ERROR.

ABSOLUTE OUTPUT RULE — The output MUST start directly with the first word of the first paragraph of scientific prose. DO NOT write any plan, DO NOT display any paragraph assignments, DO NOT output any title, label, header, preamble, note, or introductory text before the prose. DO NOT use expressions such as "Silent Planning Step", "Paragraph 1 plan", "Plan:", or any equivalent. DO NOT use asterisks or markdown formatting of any kind before or within the prose. The very first character of the output MUST be the first letter of the first sentence of paragraph 1. Any text, symbol, or character appearing before the first sentence of the prose constitutes a CRITICAL GENERATION ERROR that invalidates the entire output.

---

### ABSOLUTE RULE: COMPLETE ENTITY COVERAGE

ALL INFORMATION, VALUES, OBSERVATIONS, BEHAVIORS, AND ECOLOGICAL REMARKS PRESENT IN THE GENERATED TEXT MUST BE DIRECTLY AND SPECIFICALLY RELATED TO {SPECIES_NAME} ({SPECIES_LATIN}).

ALL ENTITIES LISTED IN {ENTITY_ANNOTATIONS} MUST MANDATORILY APPEAR IN THE GENERATED TEXT. NO ENTITY MAY BE OMITTED, EVEN PARTIALLY. EACH ENTITY MUST BE PRESENT AT LEAST ONCE IN THE PROSE AND MUST BE CORRECTLY ANNOTATED IN THE FORMAT [ENTITY_LABEL = VALUE UNIT] IMMEDIATELY AFTER ITS MENTION IN THE TEXT. FAILURE TO COMPLY WITH THIS RULE CONSTITUTES A CRITICAL GENERATION ERROR.

**CRITICAL RULE – Repeated mentions of an entity must each be annotated AND phrased differently:**
An entity MAY be mentioned more than once across the text, wherever it naturally fits the biological narrative — this is normal in authentic scientific writing. When an entity is mentioned again in a later paragraph:

- EVERY occurrence MUST carry its own annotation bracket `[LABEL = VALUE UNIT]`. Leaving any occurrence unannotated is a CRITICAL GENERATION ERROR.
- At each occurrence, the annotation's value and unit MUST match EXACTLY what is written in the prose AT THAT OCCURRENCE — independent of the value/unit used at any other occurrence. The value or unit MAY legitimately differ between occurrences (e.g., grams the first time, kilograms the second; days the first time, years the second; a field estimate vs. a captive-condition estimate) when this reflects a genuinely different reporting context.
- Each occurrence MUST be phrased differently — different sentence structure, different surrounding biological context (comparative, interpretive, or ecological framing). Repeating an identical or near-identical sentence template for the same entity is a CRITICAL GENERATION ERROR.
- A repetition that is correctly annotated and uses genuinely distinct phrasing, but adds no real new biological insight, is acceptable and should NOT be treated as a critical error — though varied, substantive framing (comparative, interpretive, ecological) is always preferred.

CORRECT EXAMPLE (same entity, different units, different phrasing):
"...individuals reach a maximum lifespan of 4 years [am = 4 years], a relatively long duration for a rodent of this body size." ... later: "...captive individuals have been documented to persist for as long as 48 months [am = 48 months] under favorable conditions, underscoring the species' comparatively slow life-history pace."

INCORRECT EXAMPLE (mechanical, identical repetition — CRITICAL ERROR):
"Neonates weigh approximately 5.9 grams [Wwb = 5.9 grams]." ... later, near-identical: "Neonates weigh approximately 5.9 grams [Wwb = 5.9 grams]."

INCORRECT EXAMPLE (repeated mention left unannotated — CRITICAL ERROR):
"Neonates weigh approximately 5.9 grams [Wwb = 5.9 grams], a modest mass typical of altricial newborns." ... later: "The 5.9 gram birth mass is notably low compared to the 42.2 gram adult female mass." ← the second mention of 5.9 grams has NO annotation bracket: CRITICAL ERROR.

**CRITICAL RULE – Every entity must be annotated at least once, with full coverage:**
Each entity from the species information list must appear and be annotated at least once in the generated text. There is no upper limit on the number of times an entity may be annotated, provided every occurrence follows the rule above (own bracket, exact local match, distinct phrasing).

**CRITICAL RULE – Temperature annotation (applies whenever a measurement has a temperature):**
Some measurements in {ENTITY_ANNOTATIONS} are marked with a temperature condition (e.g., `@ 5°C`). Whenever a measurement carries a temperature, BOTH the measurement AND the temperature MUST appear in the generated text. The temperature MUST

 be expressed in degrees Celsius only. It must be annotated immediately after it appears in the prose using the fixed label T, in the format: [T = VALUE °C].

MANDATORY RULES FOR TEMPERATURE:

- If a measurement has a temperature, that temperature MUST appear in the text alongside that measurement.
- The temperature annotation MUST use the label T and the format [T = VALUE °C]. Example: [T = 5 °C].
- Temperature values MUST ALWAYS be expressed using the symbol °C in the prose (e.g., "40.9 °C", "36 °C"). NEVER write "degrees Celsius" in the prose. NEVER write a temperature in Kelvin.
- The omission of an available temperature value constitutes a CRITICAL GENERATION ERROR.
- The annotation [T = VALUE °C] must appear immediately after the temperature expression in the prose, before any punctuation.
- The prose and the annotation MUST use the exact same form: if the prose says "36 °C", the annotation MUST be [T = 36 °C]. Writing "36 degrees Celsius [T = 36 °C]" or "36 °C [T = 36 degrees Celsius]" constitutes a CRITICAL ERROR because prose and annotation do not match.
- T must be annotated every time a temperature appears alongside a measurement, even if the same temperature value has already been annotated earlier in the text. Pairing a measurement with its temperature is not a stylistic restatement of the entity itself, so T is exempt from the "must be phrased differently" requirement that otherwise applies when an entity is mentioned more than once.

RULE — Temperature grouping for natural prose:
When multiple measurements share the same temperature value, DO NOT repeat the temperature annotation mechanically after each entity. Instead, introduce the shared temperature ONCE as a contextual frame at the beginning of the sentence or paragraph, then annotate all associated measurements without repeating the temperature. When entities have DIFFERENT temperatures, each temperature must be annotated immediately after its associated measurement.

CORRECT EXAMPLE:
"Metamorphosis was recorded after 142 days [tj = 142 days] at a water temperature of 5 °C [T = 5 °C]."

CORRECT EXAMPLE (shared temperature, introduced once):
"Under the thermal conditions typical of active metabolic periods in this species (40.9 °C [T = 40.9 °C]), fledging occurs at 38 days after hatching [tx = 38 days after hatching], sexual maturity is reached at 114 days after hatching [tp = 114 days after hatching], and first reproduction is typically deferred until 1825 days after hatching [tR = 1825 days after hatching]."

INCORRECT EXAMPLE (mechanical repetition of same temperature — CRITICAL ERROR):
"Fledging occurs at 38 days [tx = 38 days] at 40.9 °C [T = 40.9 °C]. Puberty is reached at 114 days [tp = 114 days] at 40.9 °C [T = 40.9 °C]. First reproduction occurs at 1825 days [tR = 1825 days] at 40.9 °C [T = 40.9 °C]."

INCORRECT EXAMPLE (Kelvin used — CRITICAL ERROR):
"Metamorphosis was recorded after 142 days [tj = 142 days] at 278.15 K."

INCORRECT EXAMPLE (prose/annotation mismatch — CRITICAL ERROR):
"incubated at 36 degrees Celsius [T = 36 °C]" ← prose says "degrees Celsius", annotation says "°C": CRITICAL ERROR.

INCORRECT EXAMPLE (temperature omitted — CRITICAL ERROR):
"Metamorphosis was recorded after 142 days [tj = 142 days]." ← missing temperature that was available.

**CRITICAL FIX 1 – Annotation must match prose EXACTLY, including qualifiers and units:**
THE VALUE AND UNIT IN THE ANNOTATION MUST MATCH EXACTLY WHAT IS EXPRESSED IN THE PROSE. THE PROSE MAY EXPRESS A VALUE IN ANY BIOLOGICALLY NATURAL FORM — AS A CONVERTED UNIT, A ROUNDED VALUE, OR AN ALTERNATIVE EXPRESSION — AND THE ANNOTATION MUST REFLECT THAT EXACT FORM.

**FOR EXAMPLE, IF THE PROSE SAYS "2 litters per year", THE ANNOTATION MUST BE [Ri = 2 litters per year], NOT [Ri = 1.5*2/365 #/d].
IF THE PROSE SAYS "approximately 28 days", THE ANNOTATION MUST BE [ab = approximately 28 days] (including the qualifier "approximately").**

DIVERSITY OF EXPRESSION ACROSS PARAGRAPHS IS ENCOURAGED.

**CRITICAL FIX 2 – No mathematical expressions or model notation inside annotations:**
ANNOTATIONS MUST NEVER CONTAIN MATHEMATICAL OPERATORS (*, /) OR MODEL-SPECIFIC NOTATION (#/d, ml O2/h as a fraction, etc.).
USE ONLY: numbers, units, words (e.g., "approximately", "to", "per"), and ranges.

ALL RULES DEFINED IN THE WRITING RULES SECTION ARE MANDATORY AND MUST BE FULLY RESPECTED IN EVERY GENERATED TEXT. FURTHERMORE, ALL OTHER SECTIONS OF THIS PROMPT CONSTITUTE IMPERATIVE CONSTRAINTS. NO SECTION MAY BE IGNORED, PARTIALLY APPLIED, OR CIRCUMVENTED. FAILURE TO COMPLY WITH ANY ONE OF THESE SECTIONS CONSTITUTES A CRITICAL GENERATION ERROR.

BEFORE PRODUCING THE FINAL TEXT, PERFORM AN EXHAUSTIVE VERIFICATION: GO THROUGH THE COMPLETE LIST OF {ENTITY_ANNOTATIONS} AND CONFIRM THAT EACH ENTITY IS (1) MENTIONED IN THE TEXT AS A NATURAL BIOLOGICAL VALUE, (2) CORRECTLY ANNOTATED WITH ITS LABEL, VALUE, AND UNIT IN SQUARE BRACKETS, AND (3) THAT THE VALUE AND UNIT IN THE ANNOTATION CORRESPOND EXACTLY TO WHAT IS WRITTEN IN THE PROSE. IF ANY ENTITY IS MISSING, INCORRECTLY ANNOTATED, OR IF THE VALUE IN THE ANNOTATION DOES NOT MATCH THE PROSE, REWRITE THE RELEVANT PARAGRAPH BEFORE SUBMITTING THE FINAL OUTPUT.

---

## SPECIES INFORMATION

### Life history measurements

The following measurements describe the life history of this species. Each value must appear naturally in the text, expressed the way a field biologist or comparative physiologist would report it in a peer-reviewed journal article.

{ENTITY_ANNOTATIONS}

### Definitions of reproductive entities N_R_i, F_R_i, and Ri

**N_R_i — Fecundity per reproductive event**
`N_R_i` is the number of eggs laid, larvae produced, or offspring generated by an individual during a single reproductive event. In biological texts, this value always appears associated with the event itself — "3 eggs per clutch", "5 pups per litter", "1,711 eggs per nest". Unit: number of eggs or offspring per reproductive event.

**F_R_i — Reproduction frequency**
`F_R_i` is the number of reproductive events performed by an individual per unit of time. In biological texts, this value always appears in natural language — "1 clutch per year", "2 nesting events per year", "3 spawnings per season". This formulation allows inferring the reference period — per year corresponds to 365 days, per month to 30 days, per day to 1 day. Unit: number of reproductive events per unit of time.

**Ri — Daily reproduction rate**
`Ri` is the daily reproduction rate of an individual. It is NEVER expressed directly as a rate in eggs per day in the prose. It is always reconstructed from one of two natural formulations:

- Definition 1 (from `N_R_i` alone): when the prose expresses total output over a time period — for example "3 eggs per year" — `N_R_i` is the numerical value and the reproduction period is inferred from the accompanying words (per year = 365 days, per month = 30 days), giving `Ri = N_R_i / period`.
- Definition 2 (from `N_R_i` and `F_R_i`): when the prose expresses both fecundity per event and event frequency separately — for example "3 eggs per clutch" and "2 clutches per year" — `Ri` is reconstructed as `N_R_i × F_R_i / period`. Both sub-expressions must appear in the prose and each must be annotated independently with its own label immediately after it.

**CRITICAL RULE — Ri annotation:**
`Ri` must NEVER be annotated as a daily numeric rate (e.g., `[Ri = 0.0164 eggs per day]`). It must be annotated in the same natural form as it appears in the prose. When `Ri` is expressed via `N_R_i` and `F_R_i` separately, annotate each sub-expression with its own label (`N_R_i` and `F_R_i`) immediately after it. Do NOT add a separate `Ri` annotation in this case — `Ri` is implicit in the combination of `N_R_i` and `F_R_i`.

**CRITICAL RULE — NEVER use the label Ri on N_R_i or F_R_i sub-expressions:**
When the prose expresses fecundity per event AND event frequency as two separate phrases, EACH sub-expression MUST be annotated with its OWN specific label — NOT with `Ri`. Using `Ri` as the label for a clutch size or a clutch frequency sub-expression is a CRITICAL GENERATION ERROR.

INCORRECT (real error to avoid):
`"Females lay 1 to 3 eggs per clutch [Ri = 1-3 eggs per clutch], and typically produce a single clutch each year [Ri = 1 clutch each year]"`
→ CRITICAL ERROR: both sub-expressions are labelled `Ri`. The first is `N_R_i`, the second is `F_R_i`.

CORRECT:
`"Females lay 1 to 3 eggs per clutch [N_R_i = 1-3 eggs per clutch], and typically produce a single clutch each year [F_R_i = 1 clutch each year]"`

**CRITICAL RULE — Do not annotate entities that are absent from the prose:**
If `N_R_i`, `F_R_i`, or `Ri` does not appear explicitly in the generated text as a natural biological expression, do NOT annotate it. Annotating an entity that has no corresponding value in the prose constitutes a CRITICAL GENERATION ERROR.

---

### Definitions of reproductive timing entities tR and tp

**tR — Time or age at first reproduction or first spawning**

`tR` is the time or age at first reproduction or first spawning. Since `tR` is a relative duration (`t`), the generated text MUST always include an explicit biological reference point in the prose (e.g., "after hatching", "from emergence", "following metamorphosis", "post-settlement", "at birth", or any other formulation biologically appropriate to the species). This reference point MUST then be reproduced exactly as written in the annotation. NEVER introduce a reference in the annotation that differs from the one written in the prose.

**tp — Time or age at puberty or sexual maturity**

`tp` is the time or age at puberty or sexual maturity. Since `tp` is a relative duration (`t`), the generated text MUST always include an explicit biological reference point in the prose (e.g., "after hatching", "from emergence", "following metamorphosis", "post-settlement", "at birth", or any other formulation biologically appropriate to the species). This reference point MUST then be reproduced exactly as written in the annotation. NEVER introduce a reference in the annotation that differs from the one written in the prose.

**CRITICAL RULE — Discriminating tR from tp:**

- Annotate `tR` when the text expresses the age or time at FIRST REPRODUCTION (first spawning, first reproductive event, first clutch, first parturition, etc.).
- Annotate `tp` when the text expresses specifically the age or time at PUBERTY or SEXUAL MATURITY, not the time to first reproduction.
- In summary: `tR` corresponds to first reproduction, `tp` corresponds to puberty or sexual maturity.

**CRITICAL RULE — The label provided in {ENTITY_ANNOTATIONS} always overrides its description:**
The source database sometimes contains an entity labeled `tR` whose accompanying comment or description mentions "age at puberty" or "sexual maturity" instead of "first reproduction". In this case, the LABEL provided (`tR`) is ALWAYS the one that must be used in the annotation — NEVER replace it with `tp` because of a misleading description. The generated prose MUST then be written in terms of FIRST REPRODUCTION (first spawning, first clutch, first parturition, first breeding event), NOT in terms of puberty or sexual maturity, even if the source description says "puberty". Ignoring the provided label and relying solely on the description constitutes a CRITICAL GENERATION ERROR.

CORRECT EXAMPLE (source entry: `tR = 730 days // age at puberty`):
> "First reproduction occurs at 730 days after hatching [tR = 730 days after hatching]."
→ CORRECT: the provided label `tR` is respected, and the prose describes first reproduction (not puberty), despite the misleading "age at puberty" description in the source.

INCORRECT EXAMPLE (same source entry: `tR = 730 days // age at puberty`):
> "Puberty is reached at 730 days after hatching [tp = 730 days after hatching]."
→ CRITICAL ERROR: the label was changed to `tp` and the prose describes puberty based on the misleading description, when the label provided in {ENTITY_ANNOTATIONS} was `tR` and must be respected as given.

**CRITICAL RULE — Reference annotation for tR and tp:**
The reference MUST appear explicitly in the generated prose BEFORE being annotated. It is not always introduced by the word "since" — it can be expressed as "after hatching", "from emergence", "following metamorphosis", "post-settlement", "at birth", or any other explicit formulation. The annotation MUST reproduce EXACTLY the formulation used in the prose. NEVER annotate a reference that is absent from the sentence. The reference point may appear ANYWHERE in the sentence — before the value, after the value, or in a different clause. SCAN THE ENTIRE SENTENCE to find the reference and include it in the annotation, regardless of where it appears.

CORRECT EXAMPLES:
- `"First spawning was recorded 18 months after hatching [tR = 18 months after hatching]"` ← reference written in the prose, reproduced in the annotation ✅
- `"First reproduction was observed 3 months post-settlement [tR = 3 months post-settlement]"` ← same ✅
- `"Sexual maturity was attained at 2 years following metamorphosis [tp = 2 years following metamorphosis]"` ← same ✅
- `"Puberty occurred 6 months after hatching [tp = 6 months after hatching]"` ← same ✅
- `"The time since birth at first brood is 4 years [tR = 4 years since birth]"` ← reference "since birth" BEFORE the value, captured in the annotation ✅

INCORRECT EXAMPLES:
- `"The time since birth at first brood is 4 years [tR = 4 years]"` ← reference "since birth" present in the sentence but ABSENT from the annotation: CRITICAL ERROR
- `"First spawning was recorded at 18 months [tR = 18 months since birth]"` ← "since birth" absent from the prose: CRITICAL ERROR
- `"Sexual maturity was attained at 2 years [tp = 2 years since birth]"` ← "since birth" absent from the prose: CRITICAL ERROR
- `"Sexual maturity was attained at 2 years after hatching [tR = 2 years after hatching]"` ← sexual maturity annotated as tR instead of tp: CRITICAL ERROR
- `"Sexual maturity was attained at 2 years following metamorphosis [tp = 2 years]"` ← reference present in the prose but absent from the annotation: CRITICAL ERROR
- `"first successful breeding event typically occurs at four years of age [tR = 4 years] after hatching"` ← reference "after hatching" placed after the annotation: rewrite as `"four years after hatching [tR = 4 years after hatching]"`: CRITICAL ERROR

Rules per measurement:

- Express each value using the biological terminology from the lexicon below, not the internal label name or any modelling notation.
- Measurements must read as empirical observations or field/lab results, never as model parameters or theoretical quantities.
- Every measurement must appear at least once across the paragraphs.
- Integrate values into sentences naturally: give units, biological context, and when relevant, a brief ecological or comparative remark.

---

## BIOLOGICAL GROUNDING RULES

The generated text must be indistinguishable from a passage in a standard peer-reviewed journal in animal ecology, comparative physiology, or ornithology/herpetology/ichthyology (depending on the taxon).

To enforce this:

1. ALL measurements originate from empirical observation, not from models. Write as if the values come from field studies, captive colonies, museum specimen series, or respirometry experiments — never from energy budget fitting or theoretical frameworks.
2. NEVER use the following DEB-specific phrasings or concepts:

   - "energy allocation", "energy buffer", "reproductive buffer"
   - "maturity threshold", "somatic maintenance" (as a technical term)
   - "assimilation rate" as a formal parameter
   - "energy flux", "κ-rule", "reserve dynamics"
   - "crossing of a threshold", "onset of allocation toward reproduction"
   - Any notation such as E_H, E_R, p_M, p_Am, κ, v̇
3. REPLACE each DEB concept with its standard biological equivalent:

   - age at puberty / sexual maturity → "attainment of sexual maturity", "onset of gonadal activity", "age at first reproduction" or "age at first breeding" (use ONLY when the underlying entity is genuinely about first reproduction, not puberty — see the tR vs tp distinction below; do not use these terms interchangeably)
   - ultimate wet weight → "adult body mass", "asymptotic mass", "maximum recorded body mass in adults"
   - initial wet weight (at birth/hatching) → "hatchling mass", "neonatal body mass", "mass at emergence"
   - maximum reproduction rate → "maximum clutch frequency", "annual reproductive output", "maximum laying rate"
   - maximum BMR (oxygen consumption) → "resting metabolic rate", "basal oxygen consumption", "mass-specific metabolic rate"
   - lifespan → "maximum recorded longevity", "maximum lifespan in the wild", "oldest documented individual"
   - time at fledging / weaning / metamorphosis → use the taxon-appropriate biological term (fledging age, weaning age, age at metamorphosis)
   - time at first brood → "age at first breeding", "age at first successful reproduction"
4. Anchor each measurement in a biological observation frame:

   - Cite the measurement type: "measured in captive individuals", "recorded during field surveys", "estimated from growth curves", "based on museum specimen series", "from respirometry trials"
   - When the observation frame is unknown, use hedged language: "reported values suggest", "available data indicate", "field records show"
5. Comparative and ecological remarks are encouraged:

   - Compare the value to related species or to the family average
   - Link the measurement to an ecological driver (diet, climate, predation pressure, migratory strategy)
   - Note intraspecific variation where biologically plausible

6. BIOLOGICAL WRITING STYLE — MANDATORY:

   - NEVER list measurements as a sequence of isolated sentences with identical structure. Vary sentence structure and embed measurements in their biological context.
   - Each measurement MUST be accompanied by at least one of the following:
     * A biological explanation (e.g., "reflecting the energetic cost of...", "a delay that reflects...")
     * A comparative remark (e.g., "consistent with values reported for congeners...", "unusual among Charadriiformes of similar body size...")
     * An ecological driver (e.g., "linked to prey availability...", "constrained by territory acquisition...")
     * An intraspecific variation note (e.g., "ranging from X to Y depending on local thermal conditions...")
   - Avoid mechanical sentence templates repeated identically across sentences, such as:
     * "X was measured at Y [entity = Y] at Z °C [T = Z °C]."
     * "The Z of this species is Y [entity = Y]."
   - Vary the position of the measurement within the sentence:
     * Sometimes lead with biological context, then give the value
     * Sometimes lead with the value, then explain it
     * Sometimes embed the value mid-sentence

FULL EXAMPLE — INCORRECT (mechanical, non-biological writing):
"The wet weight at birth is 34 grams [Wwb = 34 grams] at 40.9 °C [T = 40.9 °C]. The age at birth is 33 days [ab = 33 days] at 36 °C [T = 36 °C]. The time at fledging is 38 days [tx = 38 days] at 40.9 °C [T = 40.9 °C]. The time at puberty is 114 days [tp = 114 days] at 40.9 °C [T = 40.9 °C]."
→ CRITICAL ERROR: identical sentence structure, no biological context, mechanical temperature repetition.

FULL EXAMPLE — CORRECT (natural biological writing):
"Eggs incubated at 36 °C [T = 36 °C] hatch after approximately 33 days [ab = 33 days], a duration consistent with the extended incubation periods documented in other large-bodied oystercatchers. Newly emerged chicks weigh around 34 grams [Wwb = 34 grams], a modest initial mass that belies the rapid growth trajectory characteristic of semi-precocial nestlings under intensive biparental care. Under the thermal conditions typical of active metabolic periods in this species (40.9 °C [T = 40.9 °C]), a predictable sequence of developmental milestones unfolds: fledging, marked by the achievement of sustained flight, occurs at 38 days after hatching [tx = 38 days after hatching], while gonadal maturation follows considerably later, with puberty estimated at 114 days after hatching [tp = 114 days after hatching] — a delay that reflects the energetic investment required to complete somatic growth before reproductive effort begins."
→ CORRECT: varied structure, biological explanations, shared temperature introduced once, measurements embedded naturally.

---

## STRICT VOCABULARY BLACKLIST

The following terms and phrases are FORBIDDEN anywhere in the output prose, regardless of context. They are DEB stage labels that appear biologically plausible but originate from modelling vocabulary. Do not use them even paraphrased or partially:

FORBIDDEN PHRASES:

- "body mass accumulation phase" → use instead: "period of rapid mass gain", "accelerated growth phase", "phase of rapid mass increase"
- "body mass maintenance" → use instead: "meeting daily metabolic costs", "sustaining resting energetic demands", "covering daily maintenance requirements"
- "yolk reserve consumption" → use instead: "progressive yolk utilization", "depletion of endogenous yolk", "absorption of yolk nutrients"
- "cessation of all energy fluxes" → use instead: "failure of vital physiological functions", "progressive organ failure", "irreversible physiological deterioration"
- "somatic maintenance costs" → use instead: "basal maintenance requirements", "daily energetic costs of tissue upkeep"
- "maximum assimilation rate" → use instead: "peak food intake rate", "maximum ingestion rate", "highest recorded feeding rate"
- "onset of allocation toward reproduction" → use instead: "initiation of reproductive activity", "onset of breeding"
- "energy allocation toward reproduction" → use instead: "investment in reproductive effort", "resources directed toward offspring production"
- "failure of somatic maintenance" → use instead: "breakdown of physiological homeostasis", "progressive deterioration of organ function"
- "depletion of energy reserves" → use instead: "exhaustion of lipid stores", "depletion of fat reserves", "loss of body condition"

**CRITICAL FIX 3 – Reproduction rate: no daily rate, AND annotate EVERY sub-expression separately:**
For Aves and Mammalia, NEVER express reproductive output as a daily rate (e.g., "0.024 eggs per day" or "0.0082 pups per day") in either the prose OR the annotation.

**MANDATORY: Every distinct sub-expression of Ri (or any multi-part entity) that appears in the prose MUST receive its own annotation immediately after it.**

If the prose expresses Ri in two parts (clutch size AND clutch frequency), BOTH parts must be annotated independently, each immediately after the relevant phrase:

- **CORRECT:**`"females produce 1 to 2 eggs per clutch [N_R_i = 1-2 eggs per clutch], with approximately 1.5 clutches annually [F_R_i = 1.5 clutches annually]"`→ Two separate annotations with their correct labels, each placed right after the sub-expression it describes.
- **INCORRECT:**`"females produce 1-2 eggs per clutch [Ri = 1-2 eggs per clutch], with approximately 1.5 clutches annually [Ri = 1.5 clutches annually]"`→ Labels `Ri` used instead of `N_R_i` and `F_R_i`: CRITICAL ERROR.
- **INCORRECT:**`"females produce 1-2 eggs per clutch, with approximately 1.5 clutches annually [Ri = 1-2 eggs/clutch, 1.5 clutches/year]"`→ Single grouped annotation at the end: CRITICAL ERROR.
- **INCORRECT:**
  `"females produce 1-2 eggs per clutch, with approximately 1.5 clutches annually [Ri = 1.5 clutches/year]"`
  → First sub-expression not annotated: CRITICAL ERROR.

This rule applies to ALL entities, not just Ri: whenever a single entity is described by multiple sub-expressions spread across a sentence, EACH sub-expression must carry its own annotation immediately after it.

---

## SPECIES-CLASS VOCABULARY

The following terms reflect the physiological and ecological language a specialist uses when writing about {TAXONOMIC_CLASS} across the life cycle stages from {FROM_STAGE} to {TO_STAGE}. Use them to make the text sound authentically taxon-appropriate.

{LEXICON_TERMS}

- At least one term per paragraph
- Distribute terms across paragraphs; do not cluster all terms in one paragraph
- Never use them as a list; integrate them into flowing prose
- If any lexicon term appears in the FORBIDDEN list above, use the suggested replacement instead

**Using your own taxonomic knowledge to enrich biological context (optional, encouraged when accurate):**
If you have reliable knowledge of {SPECIES_NAME}'s broader taxonomy — its family, genus, order, or closely related (congeneric) species — you may draw on this to add authentic comparative or contextual framing, in the same way a specialist author naturally situates a species within its taxonomic group. This is not mandatory and should never replace coverage of the required entities; it is an optional layer of richness, used only where it fits naturally.

- Use this only when you are reasonably confident the information is accurate for this specific species. If you are not certain of a specific fact (e.g., the exact name of a related species, a precise classification detail), prefer a general, safely vague phrasing ("congeneric species", "related murid rodents", "other members of this family") over a specific claim that might be incorrect.
- Never invent a specific comparison species, family, or taxonomic fact you are not confident about. A vague but accurate statement is always preferable to a specific but uncertain one.
- CRITICAL: any value, measurement, or annotation in the text must belong exclusively to {SPECIES_NAME} ({SPECIES_LATIN}). Never attach an entity annotation to a value that is being attributed, even implicitly, to a comparison or related species. Comparative or taxonomic context may be mentioned narratively without annotation, but the annotated entities themselves must always describe {SPECIES_NAME} only.

---

## WRITING RULES

* Register: {REGISTER}
* 150 to 200 words per paragraph
* Vary paragraph openings; do not always begin with the species name
* Vary rhetorical mode across paragraphs: descriptive, comparative, mechanistic, measurement-contextual
* Vary sentence length and subordination depth
* Plain scientific prose only; no bullet points, headers, bold, or markdown
* NEVER use asterisks (`*`) anywhere in the generated text — not around species names, not for italics, not for bold. Species names must be written in plain text without any markdown formatting. INCORRECT: "The Kerguelen sea urchin *Abatus cordatus* reaches..." CORRECT: "The Kerguelen sea urchin Abatus cordatus reaches..."
* One blank line between paragraphs
* Output the paragraphs only, with no preamble or closing remarks
* Do not use em-dashes
* Do not use AI generic words or excessive present-continuous constructions
* The finished text must be indistinguishable from a passage authored by a human specialist and submitted to a journal such as Journal of Avian Biology, Copeia, Journal of Fish Biology, or Physiological and Biochemical Zoology
* Every measurement mentioned in the text must be followed immediately by an annotation in square brackets in the format: [ENTITY_LABEL = VALUE UNIT]
* The VALUE and UNIT in the annotation must match exactly what is expressed in the prose, not the raw value from SPECIES INFORMATION
* Example: if the prose says "approximately 28 days", write [ab = approximately 28 days]
* Example: if the prose says "four weeks", write [tj = 4 weeks]
* Example: if the prose says "12 years", write [am = 12 years]
* Example: if the prose says "110 to 140 days", write [tj = 110-140 days]
* Example: if the prose says "between 3.5 and 4.2 cm", write [Li = 3.5-4.2 cm]

**CRITICAL FIX 4 – Unit spelling in annotation must match prose LETTER FOR LETTER:**The unit in the annotation must be written **character-for-character identically** to how it appears in the prose. There are no exceptions.

**MANDATORY COPY-PASTE DISCIPLINE:** Do not retype the unit from memory, from habit, or from its standard scientific abbreviation. After writing the value and unit in the prose, COPY that exact unit substring — character for character — directly into the annotation bracket. Treat this as a literal copy operation, not a recall operation. This applies with NO exceptions, including for units that have a very common scientific abbreviation (g, mL, cm, mL O2/h, etc.) — the existence of a standard abbreviation is NOT a license to use it in the annotation unless the prose itself used that exact abbreviated form.

- If the prose writes "days", the annotation MUST write `[tp = 42 days]`. Writing `[tp = 42 d]` is a CRITICAL ERROR.
- If the prose writes "16 days", the annotation MUST be `[tx = 16 days]`. Writing `[tx = 16 d]` is a CRITICAL ERROR.
- If the prose writes "grams", the annotation MUST write "grams", not "g".
- If the prose writes "centimeters", the annotation MUST write "centimeters", not "cm".
- If the prose writes "years", the annotation MUST write "years", not "yr".
- If the prose writes "milliliters per hour", the annotation MUST write "milliliters per hour", not "ml O2/h" or "ml/h".
- If the prose writes "milliliters of oxygen per hour", the annotation MUST write "milliliters of oxygen per hour".

**The annotation unit is NOT a standardized scientific abbreviation. It is a literal copy of the unit as written in the prose.**

**HIGH-RISK ENTITIES — KNOWN FAILURE PATTERN, EXTRA VIGILANCE REQUIRED:**
`JOi` (oxygen consumption / metabolic rate) and ALL mass entities (`Wwb`, `Wwi`, `Wdi`, and any other body-mass or birth-mass entity) are the entities most frequently mis-annotated with a scientific abbreviation instead of the prose's actual wording. This is a confirmed, recurring failure — not a hypothetical one. Before finalizing ANY annotation for `JOi` or a mass entity, perform this specific check:

- For `JOi`: did the prose say "milliliters per hour" / "milliliters of oxygen per hour" (spelled out)? → the annotation must repeat that exact spelled-out phrase, NEVER "ml/h" or "ml O2/h", even though "ml O2/h" is the standard scientific notation for this quantity.
- For any mass entity (`Wwb`, `Wwi`, `Wdi`...): did the prose say "grams" (spelled out)? → the annotation must say "grams", NEVER "g", even though "g" is the standard scientific abbreviation for grams.
- This check applies in BOTH directions: if the prose itself uses the abbreviated form ("g", "ml/h"), the annotation must also use that same abbreviated form — the goal is always EXACT matching, never a default to either spelled-out or abbreviated form on its own.

REAL FAILURE EXAMPLE TO AVOID (this exact pattern has occurred — do not repeat it):
`"a basal metabolic rate of 83.46 milliliters of oxygen per hour [JOi = 83.46 ml O2/h]"` ← CRITICAL ERROR: prose is spelled out, annotation is abbreviated. They must match.
`"the maximum adult body mass attained by females is 26 grams [Wwi = 26 g]"` ← CRITICAL ERROR: prose says "grams", annotation says "g". They must match.

CORRECT FORM of the same examples:
`"a basal metabolic rate of 83.46 milliliters of oxygen per hour [JOi = 83.46 milliliters of oxygen per hour]"`
`"the maximum adult body mass attained by females is 26 grams [Wwi = 26 grams]"`

**Compound units (metabolic rates, etc.) — CRITICAL:**For entities like JOi (oxygen consumption), the annotation unit must reproduce EXACTLY what the prose says.

- Prose says "113.5 milliliters per hour" → annotation: `[JOi = 113.5 milliliters per hour]`
- Prose says "113.5 ml per hour" → annotation: `[JOi = 113.5 ml per hour]`
- Writing `[JOi = 113.5 ml O2/h]` is a CRITICAL ERROR even if that is the original DEB notation.

**CRITICAL FIX 5 – Conflicting values for the same entity in the same paragraph must not create ambiguity:**
If multiple values exist for the same entity within the same paragraph, either present them as a **single annotation with a range** or with a qualifier, OR present them as genuinely distinct, separately-phrased occurrences EACH carrying its own annotation (per the Repeated-Entity rule above). Do NOT leave a second value unannotated — every value that appears in the prose must carry its own bracket.

**Forbidden example:**
`"Puberty occurs at 42 days [tp = 42 days], although some sources report 14 days [tp = 14 days]"`
→ This creates ambiguity for NER training (two conflicting values for the same entity in the same paragraph, both annotated identically with no distinguishing context).

**Correct examples:**

- `"Puberty occurs between 14 and 42 days [tp = 14-42 days]"` (merged into a single range)
- `"Reported age at puberty ranges from 14 to 42 days [tp = 14-42 days]"` (merged into a single range)
- `"Field-reared individuals reach puberty at approximately 42 days [tp = approximately 42 days], whereas captive individuals under accelerated rearing conditions have been recorded reaching puberty as early as 14 days [tp = 14 days]"` (two genuinely distinct, separately annotated occurrences with different phrasing and an explicit reason for the divergence)

**Note:** The unit appears exactly as written in the prose, letter for letter. Never substitute an abbreviation for a spelled-out word. "days" stays "days"; "milliliters per hour" stays "milliliters per hour".

* The annotation appears immediately after the measurement span, before any punctuation mark
* Never group multiple annotations in a single square bracket

**CRITICAL FIX 7 – Every annotation must be placed IMMEDIATELY after the exact value it annotates. NO EXCEPTIONS.**

Each annotation must follow its value directly, with no intervening words, phrases, punctuation, or other annotations between the value and its bracket. This rule is absolute and applies to every single annotation in the text.

CORRECT:
"the age at first reproduction is 1,098 days [tR = 1,098 days since birth] when maintained at 5 °C [T = 5 °C]."
→ [tR = 1,098 days since birth] follows "1,098 days" directly. [T = 5 °C] follows "5 °C" directly. Each annotation is glued to its value.

INCORRECT — annotations grouped at end of sentence (CRITICAL ERROR):
"the age at first reproduction is 1,098 days when maintained at 5 °C [tR = 1,098 days since birth] [T = 5 °C]."
→ [tR = 1,098 days since birth] is separated from "1,098 days" by "when maintained at 5 °C". FORBIDDEN.

INCORRECT — annotation delayed by other words (CRITICAL ERROR):
"the age at first reproduction is 1,098 days, which was measured at 5 °C [tR = 1,098 days since birth]."
→ [tR = 1,098 days since birth] is not placed immediately after "1,098 days". FORBIDDEN.

MANDATORY RULES:

- NO words, phrases, or punctuation may appear between a value and its annotation.
- NO other annotation may appear between a value and its annotation.
- Annotations must NEVER be grouped together at the end of a sentence or clause.
- Every annotated value must carry its annotation at the exact position where the value appears.
- Violating this rule at any position in the text constitutes a CRITICAL GENERATION ERROR.

**CRITICAL FIX 6 – Scientific notation conversion mandatory:**
Never use `e-` or `e+` in prose or annotation. Convert to decimal or explicit power of ten.
Example: `2.4e-3 g` → prose "0.0024 g" → annotation [Wwb = 0.0024 g].
Example: `9e-3 cm` → prose "0.009 cm" or "9 × 10⁻³ cm" → annotation [Li = 0.009 cm] or [Li = 9 × 10⁻³ cm].

---

## SELF-CHECK BEFORE OUTPUT

Before writing each sentence, verify:

- Does this sentence contain any phrase from the FORBIDDEN list above?
- Does this sentence contain any asterisk (`*`) character? → If yes, this is a CRITICAL ERROR — remove all asterisks and write species names in plain text.
- Is this the first sentence of the output? → Verify that NO plan, header, label, assignment, or preamble appears before it. If anything appears before the first sentence of paragraph 1, DELETE it immediately.
- Does this sentence reveal the DEB parameter structure (e.g. daily rate, threshold crossing, allocation rule)?
- Does this measurement read as a model parameter rather than an empirical observation?
- Does the annotation contain mathematical operators (*, /) or model notation (#/d)? → If yes, rewrite.
- For Aves/Mammalia: does the reproduction annotation include a daily rate? → If yes, rewrite to clutch/litter size + frequency.
- Does the annotation value match the prose EXACTLY (including qualifiers like "approximately")? → If no, rewrite.
- Does the unit in the annotation match the prose LETTER FOR LETTER? (e.g., if the prose says "days", the annotation must say "days" not "d"; if the prose says "milliliters per hour", the annotation must say "milliliters per hour" not "ml O2/h") → If no, rewrite.
- Is this annotation for `JOi` or a mass entity (`Wwb`, `Wwi`, `Wdi`, etc.)? → These are KNOWN HIGH-RISK entities for this specific error. Re-check explicitly: does the prose say "grams" but the annotation say "g"? Does the prose say "milliliters of oxygen per hour" or "milliliters per hour" but the annotation say "ml O2/h" or "ml/h" (or vice versa)? → If there is ANY mismatch, this is a CRITICAL ERROR — fix it before continuing, even if the abbreviated form is the standard scientific notation for this quantity.
- If an entity (e.g., Ri) is expressed in two sub-parts across the sentence (e.g., clutch size AND clutch frequency), does EACH sub-part have its own annotation immediately after it? → If no, add the missing annotation.
- Does any annotation contain a compound unit abbreviation (like "ml O2/h", "ml/h", "#/d") instead of the full written form from the prose? → If yes, rewrite.
- ARE ALL ENTITIES FROM {ENTITY_ANNOTATIONS} PRESENT AND CORRECTLY ANNOTATED IN THE TEXT PRODUCED SO FAR?
- Have all {N_PARAGRAPHS} paragraphs been completed? → If all entities are covered but {N_PARAGRAPHS} paragraphs have not been reached, DO NOT STOP — continue writing additional paragraphs with biological, ecological, comparative, or physiological content about {SPECIES_NAME} ({SPECIES_LATIN}).
- Does the current paragraph have at least one entity from {ENTITY_ANNOTATIONS} assigned to it in the initial plan? → If all assigned entities for this paragraph have already been used in a previous paragraph, redistribute: move an entity from a later paragraph into this one.
- Does the current paragraph contain at least 150 words? → If not, expand it before proceeding to the next paragraph.
- For every measurement that carries a temperature (marked with `@ X°C` in {ENTITY_ANNOTATIONS}): is that temperature expressed in degrees Celsius in the prose AND annotated as [T = X °C] immediately after it? → If no, rewrite.
- Does any temperature value appear in Kelvin anywhere in the prose or in any annotation? → If yes, convert to Celsius and rewrite.
- Does the prose use "degrees Celsius" instead of "°C" for any temperature? → If yes, this is a CRITICAL ERROR — replace with the °C symbol.
- Does the annotation use a different form than the prose for the temperature (e.g., prose says "36 °C" but annotation says "36 degrees Celsius")? → If yes, this is a CRITICAL ERROR — make them match exactly.
- Are multiple measurements with the same temperature annotated with repeated [T = X °C] after each one? → If yes, rewrite to introduce the shared temperature once as a contextual frame and remove the repetitions.
- Does this sentence contain a measurement but lack biological context (explanation, comparison, ecological driver, or variation note)? → If yes, enrich the sentence before proceeding.
- Does this sentence follow the same structure as the previous sentence (e.g., "X is Y [entity = Y] at Z °C [T = Z °C]")? → If yes, rewrite with a different sentence structure.
- For EVERY annotation in this sentence: is the annotation placed DIRECTLY and IMMEDIATELY after the value it annotates, with no intervening words, punctuation, or other annotations? → If any annotation is delayed or grouped at the end, rewrite the sentence so each annotation follows its value directly.
- Are any annotations grouped together at the end of a sentence or clause instead of each being attached to its own value? → If yes, this is a CRITICAL ERROR — rewrite immediately.
- Has this entity already appeared earlier in the text? → If yes, this occurrence MUST still carry its own annotation bracket matching the prose at THIS occurrence — leaving it unannotated is a CRITICAL ERROR. Also verify this occurrence is phrased with a different sentence structure than the earlier one(s); an identical or near-identical sentence template is a CRITICAL ERROR.
- Does the current paragraph restate an earlier measurement using the SAME sentence structure as its earlier occurrence? → If yes, rewrite this occurrence with a different sentence structure, ideally serving a different rhetorical function (interpretive, comparative, ecological) — but keep its own matching annotation bracket.
- Is `Ri` expressed via separate `N_R_i` and `F_R_i` sub-expressions in this sentence? → If yes, annotate each sub-expression independently with its OWN label (`N_R_i` for clutch/litter size, `F_R_i` for frequency) immediately after it. Do NOT use `Ri` as the label for either sub-expression. Do NOT add a separate `Ri` annotation. Using `[Ri = 1-3 eggs per clutch]` or `[Ri = 1 clutch per year]` is a CRITICAL ERROR — these must be `[N_R_i = ...]` and `[F_R_i = ...]` respectively.
- Is `Ri` expressed as a direct daily numeric rate anywhere in the prose or annotation (e.g., "0.0164 eggs per day")? → If yes, this is a CRITICAL ERROR — rewrite to a natural biological formulation (per nest, per year, etc.).
- Does any annotation exist for `N_R_i`, `F_R_i`, or `Ri` where no corresponding value appears in the prose? → If yes, remove the annotation.
- Is the reference point for `tR` or `tp` present in the prose AND captured in the annotation? → The reference may appear ANYWHERE in the sentence (before the value, after the value, or in a different clause). SCAN THE ENTIRE SENTENCE to find the reference and include it in the annotation regardless of its position. INCORRECT: "the time since birth at first brood is 4 years [tR = 4 years]" ← reference "since birth" is present in the sentence but missing from the annotation — CRITICAL ERROR. CORRECT: "the time since birth at first brood is 4 years [tR = 4 years since birth]". If the reference appears AFTER the annotation bracket (e.g., "[tR = 4 years] after hatching"), rewrite the sentence so value and reference appear together before the annotation: "4 years after hatching [tR = 4 years after hatching]".
- Does any annotation use the label `ap`? → If yes, this is a CRITICAL ERROR — replace with `tR` or `tp` depending on whether the text refers to first reproduction or to puberty/sexual maturity.
- Does the generated sentence containing `tR` or `tp` include an explicit reference point in the prose? → If no, this is a CRITICAL ERROR — rewrite the sentence adding the biologically appropriate reference for the species.
- Does the reference in the `tR` or `tp` annotation correspond EXACTLY to the wording written in the prose? → If no, this is a CRITICAL ERROR — reproduce the exact wording from the prose.
- Is a `tR` annotation used when the text actually refers to puberty or sexual maturity rather than first reproduction? → If yes, replace with `tp` — UNLESS the label `tR` was explicitly provided in {ENTITY_ANNOTATIONS}, in which case keep `tR` and rewrite the prose to describe first reproduction instead (see the label-override rule above).
- Is a `tp` annotation used when the text actually refers to first reproduction rather than puberty or sexual maturity? → If yes, replace with `tR`.

If yes to any forbidden condition above, rewrite the sentence before proceeding.

---

You are an expert scientific writer in animal biology and life history ecology.

Your task is to generate synthetic training data for a Named Entity Recognition (NER) model that extracts biological measurements from scientific text. Give answer without any comment, give only biology scientific text. BAD GENERATION : "Here is the synthetic scientific prose about *Catamblyrhynchus diadema*, formatted according to your specifications:\n\nThe Plushcap (*Catamblyrhynchus diadema*) is a tanager species". GOOD GENERATION : "The Plushcap (*Catamblyrhynchus diadema*) is a tanager species".

### ABSOLUTE RULE: COMPLETE ENTITY COVERAGE

ALL INFORMATION, VALUES, OBSERVATIONS, BEHAVIORS, AND ECOLOGICAL REMARKS PRESENT IN THE GENERATED TEXT MUST BE DIRECTLY AND SPECIFICALLY RELATED TO {SPECIES_NAME} ({SPECIES_LATIN}).

ALL ENTITIES LISTED IN {ENTITY_ANNOTATIONS} MUST MANDATORILY APPEAR IN THE GENERATED TEXT. NO ENTITY MAY BE OMITTED, EVEN PARTIALLY. EACH ENTITY MUST BE PRESENT AT LEAST ONCE IN THE PROSE AND MUST BE CORRECTLY ANNOTATED IN THE FORMAT [ENTITY_LABEL = VALUE UNIT] IMMEDIATELY AFTER ITS MENTION IN THE TEXT. FAILURE TO COMPLY WITH THIS RULE CONSTITUTES A CRITICAL GENERATION ERROR.

THE VALUE AND UNIT IN THE ANNOTATION MUST MATCH EXACTLY WHAT IS EXPRESSED IN THE PROSE. THE PROSE MAY EXPRESS A VALUE IN ANY BIOLOGICALLY NATURAL FORM — AS A CONVERTED UNIT, A ROUNDED VALUE, OR AN ALTERNATIVE EXPRESSION — AND THE ANNOTATION MUST REFLECT THAT EXACT FORM. FOR EXAMPLE, IF {ENTITY_ANNOTATIONS} CONTAINS `am = 6*365 d`, THE PROSE MAY WRITE "6 years", "approximately 2190 days", "72 months", OR "6*365 d", AND THE ANNOTATION MUST MATCH WHICHEVER FORM APPEARS IN THE PROSE: `[am = 6 years]`, `[am = approximately 2190 days]`, `[am = 72 months]`, OR `[am = 6*365 d]`. DIVERSITY OF EXPRESSION ACROSS PARAGRAPHS IS ENCOURAGED.

ALL RULES DEFINED IN THE WRITING RULES SECTION ARE MANDATORY AND MUST BE FULLY RESPECTED IN EVERY GENERATED TEXT. FURTHERMORE, ALL OTHER SECTIONS OF THIS PROMPT CONSTITUTE IMPERATIVE CONSTRAINTS. NO SECTION MAY BE IGNORED, PARTIALLY APPLIED, OR CIRCUMVENTED. FAILURE TO COMPLY WITH ANY ONE OF THESE SECTIONS CONSTITUTES A CRITICAL GENERATION ERROR.

BEFORE PRODUCING THE FINAL TEXT, PERFORM AN EXHAUSTIVE VERIFICATION: GO THROUGH THE COMPLETE LIST OF {ENTITY_ANNOTATIONS} AND CONFIRM THAT EACH ENTITY IS (1) MENTIONED IN THE TEXT AS A NATURAL BIOLOGICAL VALUE, (2) CORRECTLY ANNOTATED WITH ITS LABEL, VALUE, AND UNIT IN SQUARE BRACKETS, AND (3) THAT THE VALUE AND UNIT IN THE ANNOTATION CORRESPOND EXACTLY TO WHAT IS WRITTEN IN THE PROSE. IF ANY ENTITY IS MISSING, INCORRECTLY ANNOTATED, OR IF THE VALUE IN THE ANNOTATION DOES NOT MATCH THE PROSE, REWRITE THE RELEVANT PARAGRAPH BEFORE SUBMITTING THE FINAL OUTPUT.

ADDITIONALLY, FOR EVERY MEASUREMENT THAT CARRIES A TEMPERATURE IN {ENTITY_ANNOTATIONS} (INDICATED BY `@ X°C`): CONFIRM THAT (1) THE TEMPERATURE IS EXPRESSED IN DEGREES CELSIUS IN THE PROSE, (2) IT IS ANNOTATED AS [T = X °C] IMMEDIATELY AFTER ITS MENTION, AND (3) NO KELVIN VALUE APPEARS ANYWHERE IN THE TEXT. OMITTING AN AVAILABLE TEMPERATURE OR WRITING IT IN KELVIN CONSTITUTES A CRITICAL GENERATION ERROR.

FINAL OUTPUT START CHECK — MANDATORY BEFORE SUBMITTING: VERIFY THAT THE VERY FIRST CHARACTER OF THE OUTPUT IS THE FIRST LETTER OF THE FIRST SENTENCE OF PARAGRAPH 1. IF ANY PLAN, HEADER, LABEL, ASSIGNMENT, PREAMBLE, ASTERISK, OR ANY OTHER TEXT APPEARS BEFORE THE FIRST SENTENCE OF THE PROSE, DELETE IT ENTIRELY BEFORE SUBMITTING. THE OUTPUT MUST START DIRECTLY WITH THE SCIENTIFIC PROSE AND NOTHING ELSE.

FINAL PARAGRAPH COUNT CHECK — MANDATORY BEFORE SUBMITTING: COUNT THE TOTAL NUMBER OF PARAGRAPHS IN THE GENERATED TEXT. IF THE COUNT IS LESS THAN {N_PARAGRAPHS}, THE OUTPUT IS INCOMPLETE — ADD THE MISSING PARAGRAPHS WITH RELEVANT BIOLOGICAL, ECOLOGICAL, COMPARATIVE, OR PHYSIOLOGICAL CONTENT ABOUT {SPECIES_NAME} ({SPECIES_LATIN}) BEFORE SUBMITTING. IF ANY PARAGRAPH CONTAINS FEWER THAN 150 WORDS, EXPAND IT BEFORE SUBMITTING. SUBMITTING A TEXT WITH FEWER THAN {N_PARAGRAPHS} PARAGRAPHS OR WITH PARAGRAPHS SHORTER THAN 150 WORDS CONSTITUTES A CRITICAL GENERATION ERROR.

FINAL PLACEMENT CHECK — MANDATORY BEFORE SUBMITTING: GO THROUGH EVERY SINGLE ANNOTATION IN THE COMPLETE TEXT AND VERIFY THAT EACH ONE IS PLACED DIRECTLY AND IMMEDIATELY AFTER THE VALUE IT ANNOTATES, WITH NO INTERVENING WORDS, PHRASES, PUNCTUATION, OR OTHER ANNOTATIONS. IF ANY ANNOTATION IS SEPARATED FROM ITS VALUE BY EVEN ONE WORD, OR IF ANY ANNOTATIONS ARE GROUPED AT THE END OF A SENTENCE INSTEAD OF EACH BEING ATTACHED TO ITS OWN VALUE, THE TEXT MUST BE REWRITTEN BEFORE SUBMISSION. GROUPING ANNOTATIONS OR DELAYING THEM PAST THEIR VALUE IS A CRITICAL GENERATION ERROR THAT INVALIDATES THE ENTIRE OUTPUT.

FINAL REPEATED-ENTITY CHECK — MANDATORY BEFORE SUBMITTING: GO THROUGH EVERY ENTITY IN {ENTITY_ANNOTATIONS} AND FOR EACH ONE, IDENTIFY EVERY OCCURRENCE IN THE TEXT. VERIFY THAT (1) EVERY OCCURRENCE CARRIES ITS OWN ANNOTATION BRACKET — AN UNANNOTATED REPEATED MENTION IS A CRITICAL GENERATION ERROR; (2) AT EACH OCCURRENCE, THE ANNOTATION'S VALUE AND UNIT MATCH EXACTLY THE PROSE AT THAT OCCURRENCE; (3) NO TWO OCCURRENCES OF THE SAME ENTITY USE IDENTICAL OR NEAR-IDENTICAL SENTENCE PHRASING — IF THEY DO, REWRITE ONE OF THEM WITH A DIFFERENT SENTENCE STRUCTURE AND, WHERE POSSIBLE, NEW BIOLOGICAL FRAMING (COMPARATIVE, INTERPRETIVE, OR ECOLOGICAL) BEFORE SUBMITTING.

FINAL REPETITION CHECK — MANDATORY BEFORE SUBMITTING: GO THROUGH EVERY PARAGRAPH AND VERIFY THAT NO MEASUREMENT OR BIOLOGICAL FACT IS RESTATED USING THE SAME SENTENCE STRUCTURE AS AN EARLIER PARAGRAPH. THE FINAL PARAGRAPH IN PARTICULAR MUST NOT SUMMARISE OR LIST VALUES ALREADY REPORTED EARLIER USING THE SAME PHRASING. IF A MEASUREMENT IS RESTATED, ENSURE IT (1) CARRIES ITS OWN ANNOTATION BRACKET MATCHING THE LOCAL PROSE, AND (2) IS PHRASED DIFFERENTLY FROM ITS EARLIER OCCURRENCE — IDEALLY SERVING A NEW RHETORICAL FUNCTION (INTERPRETIVE, COMPARATIVE, OR ECOLOGICAL). REWRITE ANY PARAGRAPH THAT FAILS EITHER CONDITION BEFORE SUBMISSION.

FINAL Ri / N_R_i / F_R_i CHECK — MANDATORY BEFORE SUBMITTING: VERIFY THAT (1) Ri IS NEVER ANNOTATED AS A DAILY NUMERIC RATE, (2) WHEN Ri IS EXPRESSED VIA N_R_i AND F_R_i, EACH SUB-EXPRESSION IS ANNOTATED WITH ITS OWN LABEL IMMEDIATELY AFTER IT AND NO SEPARATE Ri ANNOTATION IS ADDED, AND (3) NO ANNOTATION EXISTS FOR N_R_i, F_R_i, OR Ri WHERE NO CORRESPONDING VALUE APPEARS IN THE PROSE.

FINAL tR / tp CHECK — MANDATORY BEFORE SUBMITTING: VERIFY THAT (1) NO ANNOTATION USES THE LABEL `ap` — ALL VALUES MUST BE ANNOTATED AS `tR` OR `tp` ACCORDING TO THE BIOLOGICAL EVENT DESCRIBED. (2) EVERY SENTENCE CONTAINING A `tR` OR `tp` ENTITY INCLUDES AN EXPLICIT REFERENCE POINT IN THE PROSE — IF NOT, REWRITE THE SENTENCE ADDING THE BIOLOGICALLY APPROPRIATE REFERENCE FOR THE SPECIES. (3) THE REFERENCE IN THE ANNOTATION CORRESPONDS EXACTLY TO THE WORDING WRITTEN IN THE PROSE — SCAN THE ENTIRE SENTENCE FOR THE REFERENCE, WHICH MAY APPEAR BEFORE THE VALUE, AFTER THE VALUE, OR IN A DIFFERENT CLAUSE. NEVER ANNOTATE A REFERENCE ABSENT FROM THE SENTENCE OR DIFFERENT FROM WHAT IS WRITTEN. CRITICAL EXAMPLE: "the time since birth at first brood is 4 years [tR = 4 years]" IS A CRITICAL ERROR — THE REFERENCE "since birth" IS IN THE SENTENCE BUT MISSING FROM THE ANNOTATION. CORRECT FORM: [tR = 4 years since birth]. (4) `tR` IS USED ONLY FOR REFERENCES TO FIRST REPRODUCTION (first spawning, first clutch, first parturition, first breeding event). (5) `tp` IS USED ONLY FOR REFERENCES TO PUBERTY OR SEXUAL MATURITY, NOT TO FIRST REPRODUCTION. (6) IF {ENTITY_ANNOTATIONS} PROVIDES THE LABEL `tR` BUT ITS COMMENT OR DESCRIPTION MENTIONS "puberty" OR "sexual maturity", THE LABEL `tR` MUST STILL BE USED AS PROVIDED, AND THE PROSE MUST DESCRIBE FIRST REPRODUCTION, NOT PUBERTY — DO NOT RELABEL THIS ENTITY AS `tp` BASED ON A MISLEADING SOURCE DESCRIPTION.

FINAL UNIT-MATCH CHECK — MANDATORY BEFORE SUBMITTING, HIGHEST PRIORITY FOR `JOi` AND MASS ENTITIES: GO THROUGH EVERY SINGLE ANNOTATION IN THE COMPLETE TEXT ONE BY ONE AND COMPARE ITS UNIT, CHARACTER BY CHARACTER, AGAINST THE UNIT WRITTEN IN THE PROSE IMMEDIATELY BEFORE IT. PAY SPECIAL, DELIBERATE ATTENTION TO EVERY OCCURRENCE OF `JOi` AND OF ANY MASS ENTITY (`Wwb`, `Wwi`, `Wdi`, AND SIMILAR) — THESE ARE THE MOST FREQUENT SOURCE OF THIS ERROR. FOR EACH ONE, CONFIRM THAT IF THE PROSE WRITES "grams", THE ANNOTATION ALSO WRITES "grams" AND NOT "g"; AND THAT IF THE PROSE WRITES "milliliters of oxygen per hour" OR "milliliters per hour", THE ANNOTATION WRITES THE SAME EXACT PHRASE AND NOT "ml O2/h" OR "ml/h". A MISMATCH IN EITHER DIRECTION — SPELLED-OUT PROSE WITH AN ABBREVIATED ANNOTATION, OR THE REVERSE — IS A CRITICAL GENERATION ERROR THAT MUST BE FIXED BEFORE SUBMISSION, REGARDLESS OF WHETHER THE ABBREVIATED FORM IS THE STANDARD SCIENTIFIC NOTATION FOR THAT QUANTITY.
