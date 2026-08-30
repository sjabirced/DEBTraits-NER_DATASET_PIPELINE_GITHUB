#!/usr/bin/env python3
"""Generate Markdown lifecycle text files from DEB model JSON summaries.

Reads the same JSON data used to produce the SVGs and writes one .md file per
class/model combination, in the exact interleaved order:
  transition → stage → transition → stage → … → transition
"""

import json
import os
import sys
from pathlib import Path

# ── re-use the shared logic from the SVG generator ────────────────────────────
sys.path.insert(0, str(Path(__file__).parent))
from generate_lifecycles import (
    BASE_DIR, MANDATORY_TRANSITIONS,
    build_transitions, get_bio_event, get_stage_names,
)

OUTPUT_DIR = Path(__file__).parent / "lifecycle_markdown"

# ── Model one-liners ──────────────────────────────────────────────────────────
MODEL_DESCRIPTIONS = {
    "std":  "Standard DEB model — isomorphic throughout; three phases: embryo, juvenile, adult.",
    "stf":  "std with foetal development — viviparous; embryo develops inside the mother via continuous maternal allocation.",
    "stx":  "stf with baby stage and weaning — adds a post-birth lactation phase ending at weaning.",
    "ssj":  "std with non-feeding shrinking stage — adds a metabolically controlled shrinking phase between two juvenile events S and J.",
    "sbp":  "std with growth ceasing at puberty — somatic growth stops permanently at P.",
    "abj":  "std with type M metabolic acceleration — V1-morphic acceleration between birth and metamorphosis.",
    "asj":  "abj with delayed start of acceleration — metabolic acceleration begins at S rather than at birth.",
    "abp":  "abj with growth ceasing at puberty — acceleration between birth and puberty; no somatic growth after P.",
    "hep":  "DEB model for hemimetabolic insects — adds a terminal imago stage triggered by the reproduction buffer.",
    "hex":  "DEB model for holometabolic insects — complete metamorphosis; larva allocates to the reproduction buffer; pupal stage.",
    "hax":  "Hybrid model for Diptera — larval acceleration until puberty, then pupation and imago emergence.",
}

# ── Transition descriptions ───────────────────────────────────────────────────
# Keyed by (transition, model) for model-specific overrides, else by transition.
TRANSITION_DESC = {
    "t0": (
        "Origin of the life cycle. The egg is fertilised and embryonic development begins; "
        "all energy is supplied by internal yolk or maternal reserves."
    ),
    "H": (
        "The organism breaks free from the egg but has not yet started external feeding. "
        "It continues to draw on internal yolk reserves and remains fully yolk-dependent."
    ),
    "G": (
        "End of the gestation period. The offspring exits the uterus after a measurable gestation "
        "duration; the mother's direct embryonic investment is complete."
    ),
    ("B", "stf"): (
        "Live birth. The neonate exits the mother and begins its independent existence outside "
        "the maternal body; standard external feeding starts."
    ),
    ("B", "stx"): (
        "Following live birth, the neonate begins nursing. "
        "The lactation phase starts and the offspring depends on maternal milk as its sole energy source."
    ),
    ("B", "hep"): (
        "The larva hatches from the egg and immediately enters the accelerating larval phase, "
        "feeding actively from the environment and growing rapidly."
    ),
    ("B", "hex"): (
        "The larva hatches from the egg and enters an accelerating larval phase in which it "
        "allocates energy to the reproduction buffer rather than to maturation."
    ),
    ("B", "hax"): (
        "The larva hatches from the egg and immediately enters a metabolically accelerating "
        "larval phase; growth rates are driven by V1-morphic dynamics."
    ),
    "B": (
        "The organism begins feeding from the external environment for the first time; "
        "independent life truly starts and somatic growth accelerates under available food."
    ),
    ("S", "ssj"): (
        "The organism stops feeding and enters a metabolically controlled shrinking phase. "
        "Body size decreases beyond what starvation alone can explain; active internal reorganisation occurs."
    ),
    "S": (
        "Metabolic acceleration begins. The larva transitions into a V1-morphic growth phase "
        "with dramatically increased growth rates relative to standard isomorphic development."
    ),
    ("J", "ssj"): (
        "The non-feeding shrinking phase ends. Normal feeding resumes and standard isomorphic "
        "growth restarts; internal reorganisation is complete."
    ),
    ("J", "hep"): (
        "The larval acceleration phase ends. The larva enters an adult-like phase in which it "
        "allocates resources to the reproduction buffer while still retaining larval morphology."
    ),
    ("J", "hax"): (
        "The larval acceleration phase ends. The larva continues to develop without acceleration, "
        "preparing physiologically for pupation."
    ),
    "J": (
        "Metamorphosis is complete. Metabolic acceleration ends and the organism adopts its "
        "post-larval form; standard isomorphic growth resumes towards puberty."
    ),
    ("X", "Aves"): (
        "Fledgling independence. The young bird achieves independent flight and foraging, "
        "ending its dependence on parental food provisioning."
    ),
    "X": (
        "Weaning. Milk dependence ends and the juvenile transitions permanently to "
        "independent solid-food feeding."
    ),
    ("P", "abp"): (
        "Sexual maturity is reached and somatic growth ceases permanently. "
        "All surplus energy is redirected from growth to reproduction."
    ),
    ("P", "sbp"): (
        "Sexual maturity is reached and somatic growth ceases permanently; "
        "the organism has attained its final body size."
    ),
    ("P", "hex"): (
        "The larval reproduction buffer reaches a critical density, triggering the onset of "
        "the pupal stage; no further larval growth occurs."
    ),
    ("P", "hax"): (
        "The larval reproduction buffer reaches a critical density, triggering pupation; "
        "the larval feeding phase ends."
    ),
    ("P", "hep"): (
        "Puberty is reached during the larval stage. The organism begins allocating resources "
        "to the reproduction buffer while still retaining larval morphology."
    ),
    "P": (
        "First reproduction event. Energy allocation shifts permanently from somatic growth "
        "to reproduction; the organism is now sexually mature."
    ),
    "U": (
        "The pupa completes its internal reorganisation. Larval tissues have been dismantled "
        "and rebuilt into adult structures; the imago is ready to emerge."
    ),
    "E": (
        "The adult form (imago) emerges from the pupal case. It will not grow and does not "
        "reproduce; it uses accumulated reserves for maintenance, dispersal and mating."
    ),
    "M": (
        "Natural death. The organism reaches the end of its reproductive life; "
        "senescence or post-reproductive mortality marks the conclusion of the DEB life cycle."
    ),
}

# ── Stage descriptions ────────────────────────────────────────────────────────
# Keyed by (deb_stage_name, bio_stage_name) exactly as returned by get_stage_names.
STAGE_DESC = {
    ("Embryo", "Egg"): (
        "Protected by the egg shell, the embryo is entirely enclosed and sustained by internal "
        "yolk reserves. No external feeding occurs."
    ),
    ("Embryo", "Egg / Incubation"): (
        "The embryo develops inside the egg, fully dependent on yolk for energy. "
        "In many species this phase involves external incubation by a parent or the environment."
    ),
    ("Embryo", "Gestation (in utero)"): (
        "Embryonic development proceeds inside the mother, continuously supplied with nutrients "
        "via the maternal circulation. There is no discrete egg phase."
    ),
    ("Embryo", "Gestation"): (
        "Embryonic development occurs inside the mother during a bounded gestation period; "
        "the mother transfers resources to the embryo until live birth."
    ),
    ("Embryo", "Pre-feeding larva"): (
        "Although hatched, the organism has not yet begun external feeding and continues "
        "depleting its internal yolk reserves before independent life begins."
    ),
    ("Neonate", "Neonatal"): (
        "A very brief post-birth window before nursing begins. "
        "The newborn is entirely dependent on the mother and not yet feeding independently."
    ),
    ("Juvenile (Nursing)", "Suckling / Nursing"): (
        "The neonate feeds exclusively on maternal milk. "
        "Growth is rapid and the organism is entirely dependent on the mother for energy."
    ),
    ("Juvenile (Parental care)", "Nestling"): (
        "The chick remains in or near the nest, fed by parents. "
        "Feathers, muscles and the flight apparatus develop rapidly during this phase."
    ),
    ("Larva (Acceleration)", "Larval stage"): (
        "The organism grows under V1-morphic metabolic acceleration, with exceptionally rapid "
        "growth driven by accelerated surface-area-to-volume dynamics."
    ),
    ("Larva (Acceleration)", "Accelerating larval stage"): (
        "Following the delayed onset at S, the larva enters V1-morphic metabolic acceleration "
        "with dramatically increased growth rates relative to standard isomorphic development."
    ),
    ("Shrinking stage", "Non-feeding shrinking"): (
        "A metabolically controlled non-feeding phase in which body size decreases beyond what "
        "starvation alone can explain; active internal reorganisation occurs."
    ),
    ("Juvenile", "Early juvenile"): (
        "Standard isomorphic juvenile development occurring before the onset of "
        "the non-feeding shrinking phase."
    ),
    ("Larva", "Early larval stage"): (
        "Early larval development preceding the onset of metabolic acceleration; "
        "growth follows standard isomorphic rules."
    ),
    ("Juvenile", "Juvenile"): (
        "Standard isomorphic growth phase. Energy is directed towards body size increase "
        "and maturation towards puberty."
    ),
    ("Juvenile (Accel.)", "Larval-juvenile stage"): (
        "Combined larval-juvenile stage with metabolic acceleration. Since growth ceases at "
        "puberty, this is the only post-embryonic growth phase in the organism's life."
    ),
    ("Larva (Allocation)", "Larval stage"): (
        "The larva behaves as a DEB adult, allocating energy to the reproduction buffer rather "
        "than to maturation. Pupation is triggered when the buffer reaches a critical density."
    ),
    ("Juvenile", "Post-metamorphosis juv."): (
        "Post-metamorphosis isomorphic juvenile phase. Standard growth resumes after larval "
        "acceleration ends and the organism matures towards puberty."
    ),
    ("Larva (adult phase)", "Late larva"): (
        "The larva has reached puberty but retains larval morphology. It allocates energy to "
        "the reproduction buffer while still in larval form, preparing for imago emergence."
    ),
    ("Larva (no accel.)", "Late larval stage"): (
        "Post-puberty larval phase without metabolic acceleration. "
        "The larva prepares physiologically for the pupal stage."
    ),
    ("Pre-pupa", "Pre-pupal stage"): (
        "Brief preparatory stage between the larval and pupal phases. "
        "Feeding stops and the organism begins the structural changes leading to pupation."
    ),
    ("Pupa", "Pupal stage"): (
        "Complete internal reorganisation inside the puparium or chrysalis. "
        "The organism does not feed and does not grow while larval tissues are dismantled "
        "and rebuilt into adult structures."
    ),
    ("Eclosion", "Emergence"): (
        "The imago physically breaks free of the pupal case, "
        "marking the completion of holometabolic metamorphosis."
    ),
    ("Imago", "Winged adult"): (
        "The fully formed adult (imago) uses its energy reserves for maintenance, "
        "dispersal and reproductive activities. No somatic growth occurs."
    ),
    ("Imago", "Winged adult (imago)"): (
        "The fully formed adult (imago) uses its energy reserves for maintenance, "
        "dispersal and reproductive activities. No somatic growth occurs."
    ),
    ("Adult", "Breeding adult"): (
        "Full reproductive adult phase. Somatic growth has ceased and energy allocation "
        "is directed to reproduction, maintenance and survival."
    ),
}


def lookup_transition_desc(t, model, class_name):
    """Return description for a transition, preferring the most specific key."""
    if t == "X" and class_name == "Aves":
        return TRANSITION_DESC.get(("X", "Aves"), TRANSITION_DESC["X"])
    return TRANSITION_DESC.get((t, model), TRANSITION_DESC.get(t, f"Transition {t}."))


def lookup_stage_desc(deb_stage, bio_stage):
    """Return description for a stage interval."""
    return STAGE_DESC.get(
        (deb_stage, bio_stage),
        f"The organism undergoes {bio_stage.lower()} during this interval.",
    )


def generate_markdown(class_name, model, transitions):
    model_line = MODEL_DESCRIPTIONS.get(model, f"DEB model {model}.")

    lines = [
        f"# {class_name} — DEB Model: {model.upper()}",
        "",
        f"**Class:** {class_name}  ",
        f"**DEB model:** `{model}` — {model_line}",
        "",
        "## Life Cycle Timeline",
        "",
    ]

    item = 1
    for i, t in enumerate(transitions):

        # ── Transition ────────────────────────────────────────────────────────
        bio_event = get_bio_event(t, model, class_name)
        desc      = lookup_transition_desc(t, model, class_name)
        lines.append(f"{item}. **{t}** (transition) — *{bio_event}*")
        lines.append(f"   {desc}")
        lines.append("")
        item += 1

        # ── Stage (skip after last transition) ────────────────────────────────
        if i < len(transitions) - 1:
            t2 = transitions[i + 1]
            deb_stage, bio_stage = get_stage_names(t, t2, model, class_name)
            desc = lookup_stage_desc(deb_stage, bio_stage)
            lines.append(f"{item}. **{bio_stage}** (stage — DEB: *{deb_stage}*)")
            lines.append(f"   {desc}")
            lines.append("")
            item += 1

    return "\n".join(lines)


def main():
    OUTPUT_DIR.mkdir(exist_ok=True)

    json_files = sorted(Path(BASE_DIR).rglob("*.json"))
    success = skipped = 0

    for json_path in json_files:
        class_name, model, transitions = build_transitions(str(json_path))

        if transitions is None:
            print(f"  SKIP  {json_path.name}  — unknown model '{model}'")
            skipped += 1
            continue

        md = generate_markdown(class_name, model, transitions)
        out = OUTPUT_DIR / f"{class_name}_{model}.md"
        out.write_text(md, encoding="utf-8")

        print(f"  OK    {out.name}   ({' → '.join(transitions)})")
        success += 1

    print(f"\nDone: {success} Markdown files written, {skipped} skipped.")
    print(f"Output folder: {OUTPUT_DIR}")


if __name__ == "__main__":
    main()
