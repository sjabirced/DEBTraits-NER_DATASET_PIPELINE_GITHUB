# GSI — Verification & Reformulation Prompt (v2)

Audit/repair the **GSI** entity (and its co-located **T**) in an already-annotated
`fixed_text` so the prose reads like a real reproductive-biology / ichthyology /
invertebrate-zoology study, never uses `g/g`, and carries clean `[GSI = X%]`
annotations. This section is responsible for **GSI and the co-located T only** —
leave every other entity to its own section.

---

## 0. What GSI is

The gonado-somatic index expresses gonad mass as a proportion of body mass. Real
biological writing reports it as a **percentage**, never as `g/g` or a bare ratio.

---

## 1. Which species to process (detection)

**Decide from the entity DATA file, not from the text.** A species is "in scope"
iff its data file contains a record with `"entity": "GSI"`. Do **not** key on the
`[GSI = …]` bracket — the generator sometimes writes the GSI value into the prose
**without** a bracket (and sometimes in a sentence that never says "GSI" or
"gonad"). Keying on the bracket undercounts.

- Species **with** a GSI data record → audit it → `verdict: "REPAIRED"` (even if
  no repair ends up being needed, see §8).
- Species **without** a GSI data record → emit a pass-through audit unchanged →
  `verdict: "NO_GSI"`, `n_repairs: 0`, `corrected_text` = `corrected_text_final`
  = original `fixed_text`.

Every species gets exactly one `<annotated_basename>_gsi_audit.json` file.

---

## 2. Value & unit conversion (MANDATORY)

The data record gives the GSI value in `g/g`. **The data record is authoritative**
(the prose value may be wrong or missing).

* Percentage = `value × 100`. `0.07 → 7%`, `0.123 → 12.3%`, `0.045 → 4.5%`,
  `0.0918 → 9.18%`, `0.2 → 20%`, `0.5 → 50%`.
* Keep clean significant figures; do not invent or re-round beyond `× 100`.
* **Value expressions** appear in `entity.value`. Resolve them before converting:
  `2*0.04 → 0.08 → 8%`, `3*0.04 → 0.12 → 12%`, `0.2/15 → 0.013 → 1.3%`. If an
  expression is genuinely ambiguous and the prose did not already resolve it,
  flag `verdict: "NEEDS_REVIEW"` instead of guessing.
* The only surface unit for GSI in the prose is `%`. Never write `g/g`,
  "grams per gram", "g per gram", "grams per gram of body mass", or a bare ratio.

---

## 3. Inline annotation

Annotate the percentage verbatim, immediately after it: `[GSI = 7%]`.

* The `%` is part of the span. Epistemic qualifiers stay in the span too:
  `[GSI = approximately 7%]`, `[GSI = around 7%]`, `[GSI = up to 7%]`.
* The bracket must be a **character-for-character substring** of the sentence —
  the number form and the `%` exactly as written in the prose (no digit↔word
  swaps, no qualifier mismatch).
* **Missing annotation:** if the prose states a GSI value with no bracket, ADD the
  bracket (this is a repair, not invention — the value is present and matches the
  record). Code it `MISSING-ANNOTATION+UNIT-MISMATCH`.
* **Multiple mentions:** a text often states GSI in 2–4 places (intro, value
  sentence, recap, cross-entity summary). Repair **every** GSI mention, including
  the ones in sentences that never say "GSI"/"gonad".
* **Stray bracket with no value:** if a bracket is attached to a generic mention
  with no in-prose percentage (e.g. `…the gonado-somatic index [GSI = 0.04 g/g]…`),
  remove the bracket and trim the surrounding interpretive clause; do not leave a
  bracket that can't be a substring of a real percentage.

---

## 4. Co-located T

* If the GSI sentence has a temperature, keep it annotated: `5 °C [T = 5 °C]`.
  Use the value from the record's temperature field (convert `C2K(x)` → `x °C`).
* If the record provides a temperature but the GSI sentence lacks one, **add it**
  in the GSI sentence (record-supported, so legitimate). Record it in
  `prose_edits[].inserted`.
* A `[T = …]` that is co-located with a **different** entity (e.g. `am`, `tp`,
  early-life survival) is **not** yours — do not touch that sentence.

---

## 5. Natural phrasing (biology register only)

Rewrite the GSI sentence(s) to read like a real study. **DEB vocabulary is allowed
only inside the annotation brackets** (the identifiers `GSI` / `T`); it must never
appear in the prose itself.

Forbidden in prose (DEB / framing leakage): "reproduction buffer", "energy
allocation", "energy/somatic reserves", "reproductive investment", "reproductive
allocation", "gonadal allocation", "energetic trade-offs", "kappa", "reserve",
"assimilation", "energy accumulation", "channel … into", "partition energetic
resources", "buffer against".

Prefer neutral biology: "gonadosomatic index", "gonad maturation / development",
"reproductively active / ripe / gravid / mature females", "spawning season",
"measured / recorded / averaged / reached". Vary the wording — do not reuse one
template. Introduce `(GSI)` once on first mention, then use `GSI` /
"gonadosomatic index".

Acceptable register examples (rephrase, never copy verbatim):

* "Mature females developed a gonadosomatic index of 7% [GSI = 7%] …"
* "At the peak of the reproductive season the GSI reached 7% [GSI = 7%] …"
* "The gonadosomatic index averaged 7% [GSI = 7%] in reproductively active females …"

---

## 6. Context: keep only what the record supports

* **Sex / maturation period / season / station** from the comment → descriptive
  context only (not annotated, numbers unchanged). Standard observational framing
  ("in spawning females", "during the spawning season") is acceptable register.
* **"energy accumulation"** — use only if it appears verbatim in the comment you
  are quoting; otherwise prefer "gonad maturation / development".
* **Provenance comments** like "based on Sparus aurata", "based on Etelis
  carbunculus" are methodological, **not** biological context — do **not** weave
  them into the prose. (The borrowed value may justify an `approximately`
  qualifier in the span.)
* Do **not** invent sex, season, station, or any number not in the record.

---

## 7. Hard rules

* Only the `× 100` conversion is allowed on the value. Never re-round to a
  different GSI value.
* No DEB vocabulary in prose (see §5).
* **No evaluative / interpretive clauses the record does not support** — drop
  magnitude judgements ("modest", "low", "high", "substantial"), strategy claims
  ("iteroparous", "bet-hedging", "batch spawner", "conservative life history"),
  species/comparative claims ("characteristic of this cold-water species",
  "comparable to congeners", "lower than temperate species"), and "reflects /
  underscores / suggests / indicates that …" interpretations. A neutral
  observational closing clause is fine only when the record supports it; an
  evaluative judgement about magnitude or species is not.
* **Preserve every other entity's annotation verbatim** when you rewrite a
  cross-entity sentence (e.g. a life-history summary carrying `[Lp = …]`,
  `[Wwp = …]`, `[Wwb = …]`, `[am = …]`, `[tp = …]`, `[F_R_i = …]`). Convert/clean
  only the GSI (and co-located T) part; keep the rest exact. Never delete a
  sentence solely to drop a GSI clause if doing so would remove another entity's
  bracket — rewrite to keep that bracket.

---

## 8. Two-stage output & schema

Write UTF-8, indent 2, to `<annotated_basename>_gsi_audit.json`:

* `corrected_text` = **stage 1**: mechanical entity conversion only (every GSI
  prose value `g/g → %` and every `[GSI = …]` bracket → `[GSI = X%]`), prose
  otherwise unchanged.
* `corrected_text_final` = **stage 2**: after the biology-register rewrite, clause
  removal, and any inserted T.
* `repairs[]` = the GSI value/unit conversions and added annotations.
* `prose_edits[]` = sentence-level rewrites and deletions, each with a reason.

```json
{
  "id": <integer>,
  "specie": <string>,
  "specie_en": <string>,
  "corrected_text": <string>,
  "verdict": "REPAIRED" | "NO_GSI" | "NEEDS_REVIEW",
  "n_repairs": <integer>,
  "repairs": [
    { "entity": "GSI",
      "repair_mode": "value_unit_conversion" | "add_annotation_value_unit_conversion",
      "code": "UNIT-MISMATCH+VALUE-FORMAT" | "MISSING-ANNOTATION+UNIT-MISMATCH",
      "before": <string>, "after": <string>, "sentence": <string> }
  ],
  "prose_edits": [
    { "sentence_before": <string>, "sentence_after": <string>,
      "inserted": <string>, "reason": <string> }
  ],
  "corrected_text_final": <string>
}
```

---

## 9. Audit / VALUE-MATCH sync (keep in sync)

Once generation emits `X%`, the verification side must accept the conversion:
for GSI, prose `X%` is value-consistent with source `V g/g` when `X = V × 100`,
and the unit `%` is correct (not `g/g`). Otherwise every GSI bracket is wrongly
flagged VALUE-MISMATCH / UNIT-MISMATCH.

---

## 10. Validation safety net (run after every batch)

Because hand-authored edits can miss a mention, validate each REPAIRED file:

1. **No unit residue** anywhere in `corrected_text_final`: `grams per gram`,
   `g/g`, `g per gram` → must be 0. (This catches value sentences that never say
   "GSI"/"gonad".)
2. **Every `[GSI = …]` span ends in `%`** (no `[GSI = 0.xx …]`).
3. **`repairs[].after` and `repairs[].sentence`** are substrings of
   `corrected_text_final`; every non-empty `prose_edits[].sentence_after` too.
4. **No DEB term inside any sentence that contains a `[GSI` bracket.**
5. **Coverage:** count of `"entity": "GSI"` data records == count of `REPAIRED`
   files. No data-GSI species left as `NO_GSI`.
6. **Verdict invariants:** `NO_GSI` files contain no `[GSI`; `REPAIRED` files do.

---

### Worked example

Data: `GSI = 0.07 g/g`, `T = C2K(5)` (= 5 °C), comment "after 10 months … for
females". Original prose: "…exhibit a gonado-somatic index of 0.07 grams per gram
[GSI = 0.07 grams per gram] when measured at the ambient water temperature of 5 °C
[T = 5 °C]. This relatively low GSI … typical of many polar echinoderms."

Output (stage 2):

> "In reproductively active females sampled after roughly ten months of gonad
> maturation, the gonadosomatic index (GSI) reached 7% [GSI = 7%] at an ambient
> water temperature of 5 °C [T = 5 °C]."

(Converted value, both annotated spans, only record-supported context, no DEB
prose, no magnitude/species judgement, evaluative tail removed.)
