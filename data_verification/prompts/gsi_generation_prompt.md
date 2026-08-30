# GSI — Generation Section (gonado-somatic index)

Use this block to rephrase the part of your generation prompt responsible for the GSI entity so the output reads like a real biological study and never uses `g/g`.

## What GSI is

The gonado-somatic index expresses gonad mass as a proportion of body mass. In real biological writing it is reported as a percentage, not as `g/g`. Phrase it the way an ichthyology / invertebrate-reproduction paper would.

## Value & unit conversion (MANDATORY)

The data record gives the GSI value in `g/g` (e.g. `0.07`).

- Convert to a percentage for the prose: percentage = value × 100 → `0.07 g/g` becomes `7%`.
- Keep clean significant figures: `0.07 → 7%`, `0.123 → 12.3%`, `0.045 → 4.5%`, `0.2 → 20%`.
- Never write `g/g`, "grams per gram", or a bare ratio in the prose. The only surface unit for GSI is `%`.

## Inline annotation

Annotate the percentage verbatim, immediately after it: `[GSI = 7%]`.

The `%` is part of the span. If you use an epistemic qualifier, it stays in the span too: `[GSI = approximately 7%]`, `[GSI = around 7%]`, `[GSI = up to 7%]`.

The bracket must be a character-for-character substring of the sentence — the number form and the `%` exactly as written in the prose (no digit↔word swaps).

## Natural phrasing (vary it — do not reuse one template)

Write one or two sentences that read like a real study. Examples of register (rephrase, never copy verbatim):

- "Mature females developed a gonadosomatic index of 7% [GSI = 7%] …"
- "At the peak of the reproductive season the GSI reached 7% [GSI = 7%] …"
- "Gonad investment in ripe females corresponded to a mean gonadosomatic index of approximately 7% [GSI = approximately 7%] …"
- "The gonadosomatic index averaged 7% [GSI = 7%] in reproductively active females …"

Use "gonadosomatic index" or "gonado-somatic index". You may introduce the abbreviation "(GSI)" once and use "GSI" afterwards.

## Context to weave in when the data provides it (do NOT invent)

- **Temperature** — annotate it in the same sentence, using the value from the record's temperature field: "… measured at 5 °C [T = 5 °C]".
- **Sex / maturation period / season / station** — from the comment, as descriptive context only (e.g. "in females after about ten months of gonad maturation", "at station Anse du Halage"). Do not annotate these and do not alter or invent any number.
- **"energy accumulation"** — use this wording only when it appears verbatim in the record's comment (i.e. when you are quoting the supplied context). Do not generate it as your own framing — prefer neutral biological wording such as "gonad maturation" or "gonad development". It leans toward the DEB register suppressed below.

## Hard rules

- Do not invent or round to a different GSI value; only the × 100 conversion to `%` is allowed.
- Do not use DEB-specific vocabulary (no "reproduction buffer", "energy allocation", "kappa", "reserve", "assimilation"). Natural biological language only; GSI is the only technical identifier.
- Do not append evaluative or interpretive clauses the record does not support — e.g. "modest reproductive investment", "substantial gonad development", "characteristic of this cold-water species", "reflecting …". Report the value and its supplied context and let it stand. A neutral, observational closing clause is acceptable only when the record supports it (e.g. "consistent with the timing of the spawning season"); an evaluative judgement about magnitude or species is not.

This section is responsible for GSI (and the co-located T) only — leave every other entity to its own section.

## Worked example

Data: `GSI = 0.07 g/g`, `T = C2K(5)` (= 5 °C), comment: "after 10 months … for females".

Output:

> "In reproductively active females sampled after roughly ten months of gonad maturation, the gonadosomatic index reached 7% [GSI = 7%] at an ambient temperature of 5 °C [T = 5 °C]."

(Note how the output reports the converted value, both annotated spans, and only the context supplied by the record — with no judgement about whether 7% is high or low, and no claim about the species.)

## ⚠️ Keep your audit prompt in sync

Your verification/audit prompt currently treats the GSI value as `0.07 g/g`. Once generation emits `7%`, add a GSI rule there so the VALUE-MATCH / UNIT-MATCH checks accept the conversion:

> for GSI, prose `X%` is value-consistent with source `V g/g` when `X = V × 100`, and the unit `%` is correct (not `g/g`).

Otherwise every GSI bracket will be wrongly flagged as VALUE-MISMATCH / UNIT-MISMATCH.

## Output file structure

Write this JSON (UTF-8, indent 2) to `<annotated_basename>_gsi_audit.json`:

```json
{
  "id": <integer>,
  "specie": <string>,
  "specie_en": <string>,
  "corrected_text": <string>,
  "verdict": <string>,
  "n_repairs": <integer>,
  "repairs": [
    {
      "entity": <string>,
      "repair_mode": <string>,
      "code": <string>,
      "before": <string>,
      "after": <string>,
      "sentence": <string>
    }
  ],
  "prose_edits": [
    {
      "sentence_before": <string>,
      "sentence_after": <string>,
      "inserted": <string>,
      "reason": <string>
    }
  ],
  "corrected_text_final": <string>
}
```
