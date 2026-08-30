# ùDEB Life Cycle Timeline Generation Prompt

> **Task:** Automated generation of SVG life cycle timeline diagrams for taxonomic classes of the Animalia kingdom, combining DEB model terminology with real biological life cycle descriptions.

---

## Input

A folder `<path of my folder >` containing JSON files following the naming convention:

```
summary_<ClassName>_<model>.json
```

For example:

- `summary_Actinopterygii_abj.json`
- `summary_Actinopterygii_std.json`
- `summary_Aves_std.json`

For each JSON file in this folder, apply the following task **independently**. Read the file and generate a timeline diagram describing the main life stages and transitions for the corresponding class and model. Both the class name and the DEB model are extracted directly from the filename — for example:

- `summary_Actinopterygii_abj.json` → class: `Actinopterygii`, model: `abj`
- `summary_Aves_std.json` → class: `Aves`, model: `std`

The output must be a single SVG file saved as:

```
lifecycle_diagrams/<ClassName>_<model>.svg
```

For example:

- `summary_Actinopterygii_abj.json` → `lifecycle_diagrams/Actinopterygii_abj.svg`
- `summary_Aves_std.json` → `lifecycle_diagrams/Aves_std.svg`

---

## Critical Visual Rule — Must Be Respected in Every SVG Without Exception

The timeline must be structured as a **horizontal diagram** centered on a single arrow line that runs from left to right, starting at `t0` and ending at `M`. Each transition point is marked by a **colored filled circle** placed directly on the arrow line.

**Above the arrow line**, the diagram has two elements for each transition and each interval:

- At each transition point, the **DEB label** is written directly above the corresponding dot, using the DEB notation: `t0`, `H`, `B`, `S`, `J`, `X`, `P`, `G`, `U`, `E`, or `M`.
- Between consecutive transition points, a **colored rectangular band** spans the full interval and contains the **DEB stage name** written in bold inside it — for example *Embryo*, *Juvenile*, or *Adult*.

These DEB stage names and transition labels **must never appear below the line**.

**Below the arrow line**, the diagram mirrors this structure symmetrically:

- At each transition point, the **biological event name** is written directly below the corresponding dot, in plain biological language — for example *Egg laying*, *Hatching*, *Metamorphosis*, *Sexual maturity*, or *Death*.
- Between consecutive transition points, a **colored rectangular band** spans the same interval and contains the **biological stage name** written in bold inside it — for example *Incubation*, *Larval stage*, *Nestling*, *Fledgling*, or *Breeding Adult*.

These biological names and event labels **must never appear above the line**.

The colors of the bands above and below the line must be **coordinated**: the top DEB band and the bottom biological band covering the same interval should share the same color or complementary shades, so that the visual correspondence between DEB stages and biological stages is immediately readable.

Every transition point must have both a DEB label above the line and a biological event name below the line. Every interval between two consecutive transition points must have both a DEB stage band above the line and a biological stage band below the line. No interval and no transition point may be left unlabelled on either side.

> **This two-sided structure is absolute and must be respected in every SVG file generated without exception. Any SVG that places a DEB label below the line, or a biological term above the line, or omits any band or label, is considered invalid.**

---

## DEB Transition Definitions

The following DEB transitions mark key **biological threshold events** in an organism's life. Each transition has a precise meaning that determines when it applies. Understanding the distinction between transitions is critical for correct timeline construction.

---

### H — Hatching

The organism physically breaks out of the egg but has **not yet started feeding from the environment**. It still relies entirely on internal yolk or embryonic reserves. H is only used when a biological gap exists between the act of hatching and the onset of external feeding.

A classic example is the amphibian tadpole: it hatches from the egg but continues consuming internal yolk before it begins feeding externally. In contrast, if the organism starts feeding immediately upon leaving the egg — as in most birds, where the hatchling is fed by parents or starts foraging right away — then H and B coincide and **only B is used**. H is therefore not a universal transition: it appears only in species where the newly hatched organism remains yolk-dependent for a period after leaving the egg.

> *Real life cycle equivalent: hatching from egg while still yolk-dependent, pre-feeding larval stage*

---

### B — Birth / Start of External Feeding

The moment the organism **begins receiving food or energy from the external environment** for the first time. This is the foundational DEB transition that marks the true beginning of independent life.

In oviparous species where hatching and first feeding coincide, B equals H and only B is used. In species like amphibians, B comes after H — the tadpole hatches first (H), then later starts feeding externally (B). In viviparous species (stf, stx models), B corresponds to live birth when the neonate exits the mother and begins independent feeding. In species fed by parents immediately after hatching, B is the moment parental feeding begins.

> *Real life cycle equivalent: first external feeding, live birth, hatching when feeding is immediate*

---

### S — Start of Acceleration

The threshold at which **metabolic acceleration begins**. Used only in the `asj` model. Before S, the juvenile develops without acceleration. S marks a delayed onset of the rapid growth and development phase, distinguishing `asj` from `abj` where acceleration starts immediately at birth.

> *Real life cycle equivalent: onset of rapid larval growth phase, delayed start of metamorphic preparation*

---

### J — Metamorphosis / End of Acceleration

The threshold at which **metabolic acceleration ends** and the organism transitions to its post-larval form. Used in `abj`, `asj`, `hep`, and `hax` models. After J, the organism resumes standard isomorphic growth. This transition may or may not correspond to a visible morphological transformation — in some species it is purely physiological, while in others it corresponds to a full morphological metamorphosis.

> *Real life cycle equivalent: metamorphosis, larval-to-juvenile transformation, settlement in marine larvae, metamorphosis in amphibians*

---

### X — End of Parental Provisioning

The threshold at which the juvenile **stops depending on parental provisioning** and transitions to fully independent feeding. Exclusive to the `stx` model. The biological equivalent of X varies by taxonomic class: in mammals, X corresponds to **weaning** — the end of milk dependence and the switch to solid food; in birds, X corresponds to **fledgling** — the moment the young bird becomes capable of independent flight and foraging, marking the end of parental food provisioning. In both cases, X always falls between B and P.

> *Real life cycle equivalent: weaning in mammals, fledgling independence in birds, end of any form of post-natal parental feeding dependence*

### P — Puberty / Onset of Reproduction

The threshold at which the organism  **becomes reproductive** . In the context of this work, puberty (`p`) and first reproduction (`R`) are treated as  **equivalent** , because for most species in the AmP database, puberty is not directly observable. The only accessible measurement is the first reproduction event — that is, the first egg, first litter, or first spawning. Therefore, both `p` and `R` refer to the same biological event and are represented by the same transition point **P** on the timeline.

Before P, the organism is a juvenile allocating resources to its own development and growth. After P, it is an adult that allocates resources to reproduction. This is the most universal DEB transition — present in every model.

In models where growth ceases at puberty (`sbp`, `abp`), P also marks the permanent end of somatic growth. In species with asexual or parthenogenetic reproduction, P marks the onset of budding or clonal reproduction rather than sexual maturity.

> *Real life cycle equivalent: first egg laying, first spawning, first litter, first budding event, onset of first reproductive season

---

### G — End of Gestation (Birth)

G marks the **end of the gestation period** and coincides with **birth (B)** on the individual's timeline. It represents the moment the offspring exits the uterus after a gestation of duration  **tg** . G is exclusive to the `stx` model and applies to species with a well-defined placental gestation phase.

In practice, **tg** is the observable and measurable quantity (gestation duration in days), while **G is the endpoint of that duration** — i.e., G = t0 + tg.

G does not exist in the `stf` model: in `stf`, the mother continuously allocates resources to the developing embryo without a discrete gestation endpoint event. G is thus reserved for species where gestation is a bounded, measurable phase ending at live birth.

> *Real life cycle equivalent: parturition, live birth, end of pregnancy

---

### E — Emergence of Adult Form

The threshold at which the **adult form (imago) emerges**, triggered when the reproduction buffer reaches a critical density. Used in `hep`, `hex`, and `hax` models. The emerged imago does not grow and does not allocate to reproduction — it uses its reserves solely for maintenance and reproductive activity such as mating flights.

> *Real life cycle equivalent: adult emergence, imaginal eclosion, final moult to winged adult form*

---

### U — End of Pupal Stage

The threshold at which the **pupa completes its internal reorganisation** and the imago emerges. Used in `hex` and `hax` models only. During the pupal stage, the organism does not feed and does not grow — larval tissues are broken down and rebuilt into adult structures. The end of this stage is triggered when maturity reaches a critical threshold.

> *Real life cycle equivalent: eclosion from pupa or chrysalis, completion of holometabolic metamorphosis*

---

### M — End of Life

The **terminal point** of every DEB timeline. It marks the death of the organism after completing its reproductive life. Every timeline ends at M regardless of the model.

> *Real life cycle equivalent: natural death, senescence, post-reproductive mortality*

---

## DEB Model Descriptions and Principal Transitions

### `std` — Standard DEB Model

Isomorphic throughout all life stages. One food type, one reserve, one structure. Three life stages: embryo, juvenile, adult.

**Principal transitions:** `t0 → B → P → M`

| Transition | Biological meaning                                           |
| ---------- | ------------------------------------------------------------ |
| t0         | Fertilisation, start of embryonic development inside the egg |
| B          | Hatching and immediate onset of external feeding             |
| P          | Puberty, onset of reproduction                               |
| M          | Death                                                        |

---

### `stf` — std with Foetal Development

Like `std` but the embryo develops inside the mother via continuous maternal allocation. There is no egg phase. Development is viviparous.

**Principal transitions:** `t0 → B → P → M`

| Transition | Biological meaning                                                      |
| ---------- | ----------------------------------------------------------------------- |
| t0         | Fertilisation, start of in-utero development                            |
| B          | Live birth, the neonate exits the mother and begins independent feeding |
| P          | Puberty                                                                 |
| M          | Death                                                                   |

---

### `stx` — stf with Baby Stage and Weaning

Like `stf` but adds a post-birth lactation phase during which the neonate depends on maternal milk, followed by weaning. G marks the end of the gestation period and coincides with live birth (B on the offspring's timeline).

**Principal transitions:** `t0 → G → B → X → P → M`

| Transition | Biological meaning                                             |
| ---------- | -------------------------------------------------------------- |
| t0         | Fertilisation                                                  |
| G          | End of gestation, live birth (= B on the offspring timeline)   |
| B          | Start of external feeding, onset of lactation dependence       |
| X          | Weaning, end of milk dependence, switch to independent feeding |
| P          | Puberty                                                        |
| M          | Death                                                          |

---

### `ssj` — std with Non-Feeding Shrinking Stage

Like `std` but adds a metabolically controlled non-feeding shrinking stage between two juvenile events s and j. During this stage, the organism shrinks more than starvation alone can explain. Found in eels (Anguilliformes) and some echinoderms.

**Principal transitions:** `t0 → B → S → J → P → M`

| Transition | Biological meaning                      |
| ---------- | --------------------------------------- |
| t0         | Fertilisation                           |
| B          | Hatching and onset of external feeding  |
| S          | Start of non-feeding shrinking phase    |
| J          | End of shrinking phase, feeding resumes |
| P          | Puberty                                 |
| M          | Death                                   |

---

### `sbp` — std with Growth Ceasing at Puberty

Like `std` but somatic growth stops permanently at puberty. The organism reaches its final body size at P and maintains it until death. Found in some copepods.

**Principal transitions:** `t0 → B → P → M`

| Transition | Biological meaning                     |
| ---------- | -------------------------------------- |
| t0         | Fertilisation                          |
| B          | Hatching and onset of external feeding |
| P          | Puberty, growth permanently ceases     |
| M          | Death                                  |

---

### `abj` — std with Type M Metabolic Acceleration

Isomorphic before birth and after metamorphosis. Between birth and metamorphosis, metabolism accelerates following V1-morphy rules. Metamorphosis occurs before puberty.

**Principal transitions:** `t0 → B → J → P → M`

| Transition | Biological meaning                                          |
| ---------- | ----------------------------------------------------------- |
| t0         | Fertilisation                                               |
| B          | Hatching, onset of external feeding, acceleration begins    |
| J          | Metamorphosis, acceleration ends, isomorphic growth resumes |
| P          | Puberty                                                     |
| M          | Death                                                       |

---

### `asj` — abj with Delayed Start of Acceleration

Like `abj` but metabolic acceleration does not begin at birth. Instead, it is delayed until the organism reaches the S threshold. Before S, the juvenile develops without acceleration.

**Principal transitions:** `t0 → B → S → J → P → M`

| Transition | Biological meaning                      |
| ---------- | --------------------------------------- |
| t0         | Fertilisation                           |
| B          | Hatching, onset of external feeding     |
| S          | Start of delayed metabolic acceleration |
| J          | Metamorphosis, acceleration ends        |
| P          | Puberty                                 |
| M          | Death                                   |

---

### `abp` — abj with Growth Ceasing at Puberty

Like `abj` but growth ceases permanently at puberty. Acceleration occurs between birth and puberty. No somatic growth occurs after P.

**Principal transitions:** `t0 → B → P → M`

| Transition | Biological meaning                                       |
| ---------- | -------------------------------------------------------- |
| t0         | Fertilisation                                            |
| B          | Hatching, onset of external feeding, acceleration begins |
| P          | Puberty, acceleration ends, growth permanently ceases    |
| M          | Death                                                    |

---

### `hep` — DEB Model for Hemimetabolic Insects

Used for Ephemeroptera, Odonata and related groups. Adds a terminal imago stage triggered by reproduction buffer density. The larval stage after acceleration behaves physiologically as an adult. The imago does not grow and does not reproduce.

**Principal transitions:** `t0 → B → J → P → E → M`

| Transition | Biological meaning                                             |
| ---------- | -------------------------------------------------------------- |
| t0         | Egg development                                                |
| B          | Hatching into larva, acceleration begins                       |
| J          | End of larval acceleration, puberty occurs during larval stage |
| P          | Puberty                                                        |
| E          | Emergence of imago, triggered by reproduction buffer threshold |
| M          | Death of imago                                                 |

---

### `hex` — DEB Model for Holometabolic Insects

Used for insects with complete metamorphosis. The larval stage accelerates (V1-morph) and behaves as a reproductive adult — allocating to the reproduction buffer rather than maturing. Pupation is triggered by reproduction buffer density. The pupa does not feed and reorganises internally. The imago does not grow or reproduce.

**Principal transitions:** `t0 → B → P → U → E → M`

| Transition | Biological meaning                                               |
| ---------- | ---------------------------------------------------------------- |
| t0         | Egg development                                                  |
| B          | Hatching into larva, acceleration begins, larva behaves as adult |
| P          | Pupation triggered by reproduction buffer threshold              |
| U          | End of pupal stage, imago emerges                                |
| E          | Imago stage, no growth, no reproduction                          |
| M          | Death                                                            |

---

### `hax` — Hybrid Model for Diptera and Related Insects

A hybrid between `hep` and `hex`. The larval stage accelerates until puberty, after which acceleration ceases before pupation.

**Principal transitions:** `t0 → B → J → P → U → E → M`

| Transition | Biological meaning                                  |
| ---------- | --------------------------------------------------- |
| t0         | Egg development                                     |
| B          | Hatching into larva, acceleration begins            |
| J          | Puberty, acceleration ceases                        |
| P          | Pupation triggered by reproduction buffer threshold |
| U          | End of pupal stage, imago emerges                   |
| E          | Imago stage                                         |
| M          | Death                                               |

---

## Timeline Generation Rules

### Step 1 — Parse the Filename

Extract both the class name and the DEB model directly from the filename using the pattern `summary_<ClassName>_<model>.json`. Do not attempt to infer the model from the JSON content — the filename is the authoritative source for both the class name and the model identifier.

Examples:

- `summary_Actinopterygii_abj.json` → class: `Actinopterygii`, model: `abj`
- `summary_Actinopterygii_std.json` → class: `Actinopterygii`, model: `std`
- `summary_Aves_std.json` → class: `Aves`, model: `std`

### Step 2 — Apply Mandatory Transitions

Based on the model extracted from the filename, include the following mandatory transition points in the timeline:

| Model   | Mandatory transitions | Notes                                            |
| ------- | --------------------- | ------------------------------------------------ |
| `std` | t0, B, P, M           | —                                               |
| `stf` | t0, B, P, M           | B is live birth, embryonic phase is in utero     |
| `stx` | t0, G, B, X, P, M     | G is end of gestation/live birth, X is weaning   |
| `ssj` | t0, B, S, J, P, M     | S and J bound the non-feeding shrinking phase    |
| `sbp` | t0, B, P, M           | Growth ceases permanently at P                   |
| `abj` | t0, B, J, P, M        | Acceleration between B and J                     |
| `asj` | t0, B, S, J, P, M     | Acceleration between S and J                     |
| `abp` | t0, B, P, M           | Acceleration between B and P, growth ceases at P |
| `hep` | t0, B, J, P, E, M     | —                                               |
| `hex` | t0, B, P, U, E, M     | —                                               |
| `hax` | t0, B, J, P, U, E, M  | —                                               |

##### Rule for H — Hatching Transition

Read the field `has_species_with_ah_diff_ab` from the JSON file and apply the following rule  **before drawing the timeline** , regardless of the model:

* If `"has_species_with_ah_diff_ab": true` → **H must be added as a mandatory transition** after `t0` in the timeline. It is not optional and must always appear when this field is true.
* If `"has_species_with_ah_diff_ab": false` → **H must not appear** anywhere in the timeline, regardless of the model or any other statistic in the file.

This field is the **sole and authoritative criterion** for including or excluding H. No other rule, statistic, or inference should override it.

### Step 3 — Add Optional Transitions from Statistics

Each JSON file contains statistics about entities present across species within the class. All mandatory stages listed above must always be included. In addition, for every other entity present in the JSON statistics: if that entity appears in **more than 30% of the species** in the class, it must also be added to the timeline at its correct biological position relative to the mandatory transitions.

### Step 4 — Generate the SVG

The timeline must start at **t0** and end at **M**. Respect the Critical Visual Rule defined above without exception.

---

## Output Specification

- Process **all JSON files** in the `std_2/` folder one by one
- For each file, save the result as a standalone SVG file in the `lifecycle_diagrams/` folder
- Output filename pattern: `lifecycle_diagrams/<ClassName>_<model>.svg`
- Examples:
  - `summary_Actinopterygii_abj.json` → `lifecycle_diagrams/Actinopterygii_abj.svg`
  - `summary_Actinopterygii_std.json` → `lifecycle_diagrams/Actinopterygii_std.svg`
  - `summary_Aves_std.json` → `lifecycle_diagrams/Aves_std.svg`
- The SVG file must contain **only the SVG code**, with no additional text, no explanations, and no comments
