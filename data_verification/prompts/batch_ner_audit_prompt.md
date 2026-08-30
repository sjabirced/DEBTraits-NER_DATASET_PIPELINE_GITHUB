# Batch NER Annotation Audit — Claude Code Prompt

## Mission

You are auditing inline bracket annotations of biological/DEB entities for a batch of species.

The batch root contains **one sub-folder per species**. Process **every species folder**, one at a time.

For each species you must:

1. Read the **source data** file (ground truth) and the **annotated text** file.
2. Verify that **every entity in the source data — EXCEPT `Ri`, `N_R_i`, `F_R_i` — is correctly annotated** inside the annotated text.
3. Produce corrections where needed.
4. Write a **third JSON file** (the audit report) into the same species folder.

After the audit file is written, **every species folder must contain exactly 3 JSON files**:
`<source>.json`, `<annotated>.json`, and the new `<annotated>_audit.json`.

---

## File layout per species folder

Identify the two input files **by content**, not just by name:

| File | How to recognize | Example |
|------|------------------|---------|
| **Source data** (ground truth) | top-level keys `taxonomy` + `data` | `Abatus_cordatus.json` |
| **Annotated text** | top-level keys `id`, `specie`, `fixed_text` | `0001_Abatus_cordatus_abj.json` |

- The DEB model is `taxonomy.deb_model` (e.g. `abj`) and is also the suffix of the annotated filename.
- The id is `id` in the annotated file (zero-pad to 4 digits for the output name).

**Output file name:** `<annotated_basename>_audit.json`
→ e.g. `0001_Abatus_cordatus_abj_audit.json`

---

## What to verify (scope)

Iterate over every row in `source.data` whose `entity` is **NOT** one of `Ri`, `N_R_i`, `F_R_i`.

Examples of in-scope entities: `GSI, L6, Li, Lj, Lp, Ww0, Ww6, Wwj, Wwp, am, tR, tj, ah, ab, ap, T, …`

> **Temperature note:** `T` is not a row in `data`; it is derived from the per-entity `temp` field.
> Every entity whose `temp` is **not null** (e.g. `"C2K(5)"`) must have a `[T = X °C]` annotation in the
> **same sentence**, where `X` is the Celsius value (`C2K(5)` → `5`). If `temp` is `null`, no `T` is expected for it.

### GSI — definition and expected form

`GSI` (Gonadosomatic Index) = (gonad wet weight / total body wet weight) × 100. It is always annotated as a **percentage**, even though the source `units` field for GSI is `g/g` (a dimensionless fraction).

- **Source form:** dimensionless fraction, e.g. `0.05 g/g`.
- **Annotated form:** percent, e.g. `5 %`.
- **Value check for GSI:** the bracket number must equal `eval(source["entity.value"]) × 100`, compared as floats with relative tolerance `1e-6`. e.g. source value `0.05` → bracket must read `5` (as `5 %`, `5%`, or `five percent`, whichever is verbatim in the prose).
- **Unit check for GSI:** the bracket must carry a percentage unit (`%`, `percent`, or `per cent`). `g/g` or `grams per gram` inside a GSI bracket is a `UNIT-MISMATCH`, even if the number is numerically consistent — GSI is defined as a percentage by convention.
- **Verbatim rule still applies:** whatever percentage surface form appears in the prose (`5%`, `5 %`, `five percent`, `roughly 5 percent`) is what must appear character-for-character inside the bracket. Word-form lock and epistemic qualifiers work exactly as for other entities.
- **Sanity guard:** if a source GSI value is `> 1`, the entry may already be stored in percent rather than fraction — do not apply ×100 blindly; set `repair_mode = FLAG_MANUAL` and describe the ambiguity.

For each in-scope entity, the annotated text must contain at least one bracket `[ENTITY = value unit]` that passes **all** the checks below.

### Check 1 — PRESENCE

A bracket `[ENTITY = …]` for that entity exists in `fixed_text`.
Fail → code `MISSING`.

### Check 2 — VALUE MATCH

The number inside the bracket equals `eval(source["entity.value"])`.

- Evaluate arithmetic and scientific notation before comparing:
  `6*365` → `2190`, `36*30.5` → `1098`, `1.777e-3` → `0.001777`, `10.3e-3` → `0.0103`.
- Compare as floats with relative tolerance `1e-6` (allow prose rounding / words like "approximately").
- **GSI exception:** for the entity `GSI`, compare against `eval(source["entity.value"]) × 100` (not the raw source value), because GSI is annotated as a percentage while stored as a `g/g` fraction. e.g. source `0.05` → expected bracket number `5`.

Fail → code `VALUE-MISMATCH`.

### Check 3 — UNIT PRESENT

The bracket contains a unit, not a bare count.
Acceptable surface forms (treat as present if any appears):

| source `units` | entity | accepted in text |
|----------------|--------|------------------|
| `g/g` | `GSI` | `%`, `percent`, `per cent` (never `g/g` / `grams per gram`) |
| `g/g` | any other | `grams per gram`, `g/g` |
| `cm` | any | `cm`, `centimeters` |
| `g` | any | `grams`, `g` |
| `d` | any | `days`, `d` |
| `K` (temp) | `T` | shown in `°C` in prose, e.g. `5 °C` |

> **GSI unit lock:** a `GSI` bracket carrying `g/g` / `grams per gram` is a `UNIT-MISMATCH` (repair_mode `FIX_SPAN` or `EXPAND_BRACKET`, whichever applies to the surrounding prose). GSI must always be expressed in percent.

Fail (value present, unit absent) → code `BARE`.
Unit present but inconsistent with source → code `UNIT-MISMATCH`.

### Check 4 — VERBATIM SPAN (the core rule)

The string inside the bracket must be a **character-for-character verbatim substring** of the prose
immediately preceding the bracket (e.g. `… reaches 4.2 cm [L6 = 4.2 cm]`). No reformulation, no
digit↔word conversion, no adding or dropping words "to the bracket alone".

- Bracket **drops** words that are in the prose (qualifier or part of the value/unit clipped off, span too short) → code `SPAN-A`.
- Bracket **contains** words **not** in the prose (a qualifier, unit, or token that isn't there) → code `SPAN-B`.
- Bracket words don't match the prose **surface form** (word-form / spelling / digit-vs-word mismatch) → code `SPAN-C`.

> **WORD-FORM LOCK (check first):** number words and digits are never interchangeable, in either
> direction. `one` ≠ `1`, `single` ≠ `1`, `three to four` ≠ `3-4` ≠ `3 to 4`. If the prose has the word
> form, the bracket must have the word form (exact spelling), and vice versa. Numeric equality is **not**
> enough — only textual identity counts. (e.g. prose "roughly one clutch each day" → bracket must read
> `roughly one clutch each day`, not `roughly 1 clutch each day`.)

### Check 5 — EPISTEMIC QUALIFIERS (do NOT strip them)

These qualifier words are **part of the annotation span** whenever they appear immediately before the
annotated value in the prose:
`approximately, about, roughly, around, up to, nearly, almost, circa`.

| Prose | Correct annotation | Wrong |
|-------|--------------------|-------|
| "approximately 2190 days" | `[am = approximately 2190 days]` ✅ | `[am = 2190 days]` ❌ `SPAN-A` |
| "2190 days" | `[am = 2190 days]` ✅ | `[am = approximately 2190 days]` ❌ `SPAN-B` |

So: if a qualifier sits right before the value in the prose, the bracket **must include it** (dropping it
is `SPAN-A`); if no qualifier is in the prose, the bracket **must not add one** (`SPAN-B`).

**Never remove `approximately`, `about`, `roughly`, etc. from a bracket to make it "tighter" — that is an error, not a cleanup.** A longer verbatim span is correct and expected. Likewise, a trailing reference phrase that is genuinely in the prose (e.g. "142 days since hatching", "1098 days after metamorphosis") stays in the span verbatim — do not trim it.

### Check 6 — RELABEL / COVERAGE

- Bracket uses the wrong entity code for the value → code `RELABEL`.
- The value appears in the prose but carries **no bracket at all** → code `COVERAGE`.

### Check 7 — AGE (`a*`) vs TIME (`t*`) reference frame (DEB convention)

In DEB/AmP notation the **first letter of a temporal entity encodes its reference point**, and the two are **not interchangeable**:

- **`a*` = age — ABSOLUTE.** Measured from the **start of development** (fertilization / start of the egg = t = 0). No external reference event is needed; "from the beginning of life" is always implied.
  - `ab` age at birth (hatching), `aj` age at metamorphosis, `ap` age at puberty, `ax` age at weaning, `am` life span (age at death).
  - Prose framing: *"X old"*, *"at an age of X"*, *"X after fertilization/conception"*, *"lives up to X"* — **no intermediate "since/after `<event>`" reference**.
- **`t*` = time — RELATIVE.** A duration measured from a **specified reference event** (usually birth/hatching; sometimes metamorphosis, settlement, start of gestation…). The reference event is part of the meaning.
  - `tj` time at metamorphosis since birth, `tp` time at puberty since birth, `tx` time at weaning since birth, `tR` time at first brood since birth, `tg` gestation time (from start of gestation), `te`/`ts` time at the indicated event/stage, measured from the reference stated in the source/prose.
  - Prose framing: *"X since hatching"*, *"X after metamorphosis"*, *"X since birth"*, *"X after settlement"* — **a reference event must be present**.

> **They differ in value, not just name:** `a` and `t` measure different spans — e.g. `aj = ab + tj`
> (age at metamorphosis = age at birth + time from birth to metamorphosis). Different numbers.
> **Never silently swap the prefix to "fix" a label.**

**Rules:**

1. **The prefix comes from the source data and is authoritative.** The bracket label must match the source entity name exactly (`tj` stays `tj`, `am` stays `am`). Do not convert `a*`↔`t*`.
2. **`t*` keeps its reference in the span.** For any `t*` entity, the reference phrase (*"since hatching"*, *"after metamorphosis"*, *"since birth"*…), when present in the prose, **must stay verbatim inside the bracket** — exactly like an epistemic qualifier, never trimmed. e.g. `[tj = 142 days since hatching]`, `[tR = approximately 1098 days after metamorphosis]`.
3. **Missing reference for a `t*` entity.** If a `t*` value appears with **no reference event anywhere in its sentence**, insert the minimal reference keyword implied by the entity definition (`since birth` for `tj/tp/tx/tR` unless the source comment specifies another reference such as `after metamorphosis`), then bracket the new verbatim span. Log it in `prose_edits` (structural keyword only — never a new number). Code `COVERAGE`, `repair_mode = EDIT_PROSE`. If neither the source nor the prose makes the reference determinable, do not guess → `FLAG_MANUAL`.
4. **Framing contradicts the label.** If the prose frames an `a*` entity with a relative reference (e.g. source `am` but prose says "X since metamorphosis"), or frames a `t*` entity as an absolute age with no determinable reference, **do not rewrite the biology** → `repair_mode = FLAG_MANUAL`, code `RELABEL`, describe the conflict for human review.

---

## Repair modes

| `repair_mode` | Use when |
|---------------|----------|
| `FIX_SPAN` | correct an existing bracket span (`SPAN-A` dropped words, `SPAN-B` extra words, `SPAN-C` word-form mismatch, `VALUE-MISMATCH`, `UNIT-MISMATCH`) so it becomes a verbatim substring of the prose |
| `EXPAND_BRACKET` | a value is annotated but the unit/qualifier is outside the bracket yet present in the prose (`BARE`, `SPAN-A`) → pull those verbatim words in |
| `RELABEL` | the bracket has the wrong entity name (`RELABEL`) |
| `EDIT_PROSE` | the entity/value is absent from the prose; insert a grounded sentence + bracket (`MISSING`, some `COVERAGE`) |
| `FLAG_MANUAL` | the data is contradictory/ambiguous and you cannot safely repair — flag, do not guess |

---

## GOLDEN RULES (do not break)

1. **Never delete a bracket.** Only fix span, expand, relabel, or add. Repair-only.
2. **Never touch reproductive entities.** `Ri`, `N_R_i`, `F_R_i` are out of scope: do not verify them, do not repair them, do not list them in `repairs`. Leave them byte-for-byte identical in the corrected text.
3. **Stay grounded.** When using `EDIT_PROSE` to add a missing entity, the value/unit **must come from the source data file** — never invent numbers. If a value cannot be grounded, use `FLAG_MANUAL`.
4. **Verbatim is law.** The bracket value must be a character-for-character substring of its sentence. **Never strip epistemic qualifiers** (`approximately, about, roughly, around, up to, nearly, almost, circa`) or trailing reference phrases that are present in the prose — removing them is a `SPAN-A` error, not a cleanup. Never convert digits↔words.
5. **GSI is a percentage.** GSI brackets must carry `%` / `percent` / `per cent` and the value must be `source_value × 100`. Never leave GSI as `g/g` in the bracket.

---

## Output file structure

Write this JSON (UTF-8, indent 2) to `<annotated_basename>_audit.json`:

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

Field semantics:

- `repairs[].entity` — any in-scope entity (`GSI, L6, …, T`). **Never** `Ri` / `N_R_i` / `F_R_i`.
- `repairs[].code` — one of `MISSING, VALUE-MISMATCH, BARE, UNIT-MISMATCH, SPAN-A, SPAN-B, SPAN-C, RELABEL, COVERAGE`.
- `repairs[].before` / `after` — the bracket (or local span) exactly before and after the fix.
- `repairs[].sentence` — the full sentence the repair occurs in.
- `prose_edits[]` — only sentence-level changes (insertions/rewrites needed for `MISSING`/`COVERAGE`).
- `corrected_text` — `fixed_text` after applying all bracket-level `repairs`.
- `corrected_text_final` — `corrected_text` after additionally applying all `prose_edits`. If there are no prose edits, it equals `corrected_text`.
- `n_repairs` — `len(repairs)`.
- `verdict` — `"PASS"` if `n_repairs == 0` **and** `prose_edits == []`; otherwise `"FAIL"`.

> Always write the audit file, even on a clean PASS (empty `repairs`, empty `prose_edits`,
> `corrected_text` == `corrected_text_final` == original `fixed_text`). This guarantees 3 files per folder.

---

## How to run

1. Recommended: write a small **Python helper** for the deterministic checks (bracket extraction with regex `\[([A-Za-z0-9_]+)\s*=\s*([^\]]+)\]`, expression eval, float compare, unit/verbatim/qualifier tests, GSI ×100 conversion + `> 1` sanity guard). Use your own judgment only for `EDIT_PROSE` corrections and ambiguous `RELABEL` cases.
2. Process species folders **sequentially**. For each: locate the 2 inputs by content, run checks, build the report, write `<…>_audit.json`.
3. If a folder is missing one of the inputs or a file fails to parse, skip it and record it in the final summary (do not crash the batch).
4. At the end, print a summary table: `specie | verdict | n_repairs | codes`, plus totals (PASS/FAIL counts) and any skipped folders.

---

## Worked reference (expected behavior on `Abatus_cordatus`)

All 12 in-scope entities (`GSI, L6, Li, Lj, Lp, Ww0, Ww6, Wwj, Wwp, am, tR, tj`) are present, values match
(`6*365`→2190, `36*30.5`→1098, `1.777e-3`→0.001777, `10.3e-3`→0.0103), units included, and `T = 5 °C`
is present for every entity whose `temp = C2K(5)`.

For GSI specifically: source value `0.05 g/g` → expected bracket number `5` with a percent unit
(e.g. `[GSI = 5 %]` or whatever percent surface form is verbatim in the prose). A bracket like
`[GSI = 0.05 g/g]` would be a `UNIT-MISMATCH` **and** a `VALUE-MISMATCH` — repair via `FIX_SPAN`
so it matches the percent form present in the prose.

Apply the **keep-qualifiers** rule:

- `[am = approximately 2190 days]` is **correct** — the prose says "approximately 2190 days", so `approximately` belongs in the span. **Do not strip it.**
- `[tj = 142 days since hatching]` is **correct** — "142 days since hatching" is verbatim in the prose. **Do not trim "since hatching".**
- `[tR = 1098 days after metamorphosis]` is the one real defect: the prose reads "approximately 1098 days after metamorphosis", so the qualifier `approximately` was dropped → code `SPAN-A`, `repair_mode = FIX_SPAN`, fix to `[tR = approximately 1098 days after metamorphosis]`.

Expected result: `verdict = "FAIL"`, `n_repairs = 1` (the `tR` SPAN-A fix only).

A run that "tightens" `am`/`tj`/`tR` by deleting `approximately` / `since hatching` / `after metamorphosis` is **wrong** — those are verbatim prose words and must stay in the span.

---

*Need this prompt in French? Ask and I'll produce the `_fr` version matching your `prompt_claude_fr.md` style.*
