#!/usr/bin/env python3
"""Generate SVG life cycle timeline diagrams from DEB model JSON summaries."""

import json
import os
from pathlib import Path

BASE_DIR = str(Path(__file__).resolve().parent / "summary_by_model")
OUTPUT_DIR = str(Path(__file__).resolve().parent / "lifecycle_diagrams")

MANDATORY_TRANSITIONS = {
    "std": ["t0", "B", "P", "M"],
    "stf": ["t0", "B", "P", "M"],
    "stx": ["t0", "G", "B", "X", "P", "M"],
    "ssj": ["t0", "B", "S", "J", "P", "M"],
    "sbp": ["t0", "B", "P", "M"],
    "abj": ["t0", "B", "J", "P", "M"],
    "asj": ["t0", "B", "S", "J", "P", "M"],
    "abp": ["t0", "B", "P", "M"],
    "hep": ["t0", "B", "J", "P", "E", "M"],
    "hex": ["t0", "B", "P", "U", "E", "M"],
    "hax": ["t0", "B", "J", "P", "U", "E", "M"],
}

ENTITY_TO_TRANSITION = {
    "ab": "B", "ah": "H", "am": "M",
    "aj / tj": "J", "tg": "G", "ax / tx": "X",
    "as / ts": "S", "ap / tp": "P", "aR / tR": "P", "ae / te": "E",
}

# Canonical ordering of all possible transitions for correct insertion
TRANSITION_ORDER = ["t0", "H", "G", "B", "S", "J", "X", "P", "U", "E", "M"]

# Color pairs per interval (top lighter, bottom darker, same hue)
INTERVAL_COLORS = [
    ("#D6EAF8", "#2980B9"),  # Blue       — Embryo
    ("#D5F5E3", "#1E8449"),  # Green      — Juvenile/larval
    ("#FDEBD0", "#CA6F1E"),  # Orange     — Acceleration
    ("#F5EEF8", "#7D3C98"),  # Purple     — Metamorphosis/special
    ("#FDEDEC", "#CB4335"),  # Red        — Adult
    ("#E8F8F5", "#148F77"),  # Teal       — Imago/special
    ("#FEF9E7", "#B7950B"),  # Yellow     — Extra
    ("#F2F3F4", "#566573"),  # Grey       — Extra
]

DOT_COLORS = {
    "t0": "#1A252F", "H": "#2E86C1", "G": "#7D3C98", "B": "#1E8449",
    "S": "#CA6F1E", "J": "#CB4335", "X": "#117A65", "P": "#C0392B",
    "U": "#6E2F1A", "E": "#D35400", "M": "#566573",
}


def get_bio_event(transition, model, class_name=""):
    """Return the biological event name for a transition point."""
    if transition == "X":
        # Birds: fledgling independence; mammals and others: weaning
        bird_classes = {"Aves"}
        if class_name in bird_classes:
            return "Fledgling independence"
        return "Weaning"

    static = {
        "t0": "Fertilisation",
        "H": "Hatching",
        "G": "Live birth (parturition)",
        "U": "Pupal eclosion",
        "E": "Imago emergence",
        "M": "Natural death",
    }
    if transition in static:
        return static[transition]
    if transition == "B":
        if model == "stf": return "Live birth"
        if model == "stx": return "Nursing onset"
        if model in ("hep", "hex", "hax"): return "Hatching into larva"
        return "Hatching / First feeding"
    if transition == "S":
        return "Non-feeding phase onset" if model == "ssj" else "Acceleration onset"
    if transition == "J":
        if model == "ssj": return "Feeding resumes"
        if model in ("hep", "hax"): return "Larval accel. end"
        return "Metamorphosis"
    if transition == "P":
        if model in ("abp", "sbp"): return "Puberty / Growth ceases"
        if model in ("hex", "hax"): return "Pupation triggered"
        if model == "hep": return "Puberty"
        return "Sexual maturity"
    return transition


def get_stage_names(t1, t2, model, class_name=""):
    """Return (deb_stage_name, bio_stage_name) for interval t1 → t2."""
    # Embryo / early
    if t1 == "t0":
        if t2 == "H": return ("Embryo", "Egg")
        if t2 == "G": return ("Embryo", "Gestation")
        if t2 == "B":
            if model == "stf": return ("Embryo", "Gestation (in utero)")
            return ("Embryo", "Egg / Incubation")
    if t1 == "H" and t2 == "B": return ("Embryo", "Pre-feeding larva")
    if t1 == "G" and t2 == "B": return ("Neonate", "Neonatal")

    # Post-birth juvenile / larval stages
    if t1 == "B":
        if t2 == "S":
            return ("Juvenile", "Early juvenile") if model == "ssj" else ("Larva", "Early larval stage")
        if t2 == "J": return ("Larva (Acceleration)", "Larval stage")
        if t2 == "P":
            if model == "sbp": return ("Juvenile", "Juvenile")
            if model == "abp": return ("Juvenile (Accel.)", "Larval-juvenile stage")
            if model == "hex": return ("Larva (Allocation)", "Larval stage")
            return ("Juvenile", "Juvenile")
        if t2 == "X":
            # Birds: nestling phase until fledgling; mammals/others: nursing
            if class_name == "Aves":
                return ("Juvenile (Parental care)", "Nestling")
            return ("Juvenile (Nursing)", "Suckling / Nursing")

    if t1 == "X" and t2 == "P": return ("Juvenile", "Juvenile")

    if t1 == "S" and t2 == "J":
        if model == "ssj": return ("Shrinking stage", "Non-feeding shrinking")
        return ("Larva (Acceleration)", "Accelerating larval stage")

    # Post-metamorphosis / pupal stages
    if t1 == "J":
        if t2 == "P":
            if model == "hep": return ("Larva (adult phase)", "Late larva")
            if model == "hax": return ("Larva (no accel.)", "Late larval stage")
            return ("Juvenile", "Post-metamorphosis juv.")
        if t2 == "U": return ("Pre-pupa", "Pre-pupal stage")

    if t1 == "P":
        if t2 in ("U", "E"): return ("Pupa", "Pupal stage")
        if t2 == "M": return ("Adult", "Breeding adult")

    if t1 == "U":
        if t2 == "E": return ("Eclosion", "Emergence")
        if t2 == "M": return ("Imago", "Winged adult")

    if t1 == "E" and t2 == "M": return ("Imago", "Winged adult (imago)")

    # Fallback
    if t2 == "M": return ("Adult", "Breeding adult")
    return ("Juvenile", "Juvenile")


def wrap_text(text, max_chars):
    """Split text into lines fitting max_chars each."""
    if len(text) <= max_chars:
        return [text]
    words = text.split()
    lines, current = [], ""
    for word in words:
        if current and len(current) + 1 + len(word) > max_chars:
            lines.append(current)
            current = word
        else:
            current = (current + " " + word).strip()
    if current:
        lines.append(current)
    return lines or [text]


def svg_multiline(text, cx, y_center, max_chars, font_size, font_weight, fill, line_h=14):
    """Return SVG text elements for multi-line centered text."""
    lines = wrap_text(text, max_chars)
    n = len(lines)
    parts = []
    for i, line in enumerate(lines):
        ly = y_center - (n - 1) * line_h / 2 + i * line_h
        parts.append(
            f'<text x="{cx:.1f}" y="{ly:.1f}" text-anchor="middle" '
            f'font-size="{font_size}" font-weight="{font_weight}" fill="{fill}">'
            f'{line}</text>'
        )
    return "\n".join(parts)


def generate_svg(class_name, model, transitions):
    n = len(transitions)

    # Adaptive interval width
    interval_w = max(110, min(175, 720 // (n - 1)))
    margin = 75
    svg_w = margin + (n - 1) * interval_w + margin
    svg_h = 370

    # Key y-coordinates
    title_y = 28
    deb_label_y = 56        # DEB transition label (above band)
    band_top_y = 67         # top band top edge
    band_h = 52
    band_top_bot = band_top_y + band_h   # = 119
    timeline_y = 155        # arrow line
    band_bot_y = 191        # bottom band top edge
    band_bot_bot = band_bot_y + band_h   # = 243
    bio_label_y = 260       # biological event label (below band)

    # X positions for each transition
    xp = {t: margin + i * interval_w for i, t in enumerate(transitions)}

    out = []
    out.append(
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{svg_w}" height="{svg_h}" '
        f'viewBox="0 0 {svg_w} {svg_h}" font-family="Arial,Helvetica,sans-serif">'
    )
    out.append(f'<rect width="{svg_w}" height="{svg_h}" fill="white"/>')

    # Title
    out.append(
        f'<text x="{svg_w/2:.1f}" y="{title_y}" text-anchor="middle" '
        f'font-size="15" font-weight="bold" fill="#1A252F">'
        f'{class_name} — DEB Model: {model.upper()}</text>'
    )

    # ── Interval bands (above and below) ─────────────────────────────────────
    for i in range(n - 1):
        t1, t2 = transitions[i], transitions[i + 1]
        x1, x2 = xp[t1], xp[t2]
        w = x2 - x1
        cx = (x1 + x2) / 2
        max_c = max(9, w // 7)

        deb_stage, bio_stage = get_stage_names(t1, t2, model, class_name)
        top_c, bot_c = INTERVAL_COLORS[i % len(INTERVAL_COLORS)]

        # Top band
        out.append(
            f'<rect x="{x1}" y="{band_top_y}" width="{w}" height="{band_h}" '
            f'fill="{top_c}" stroke="#AAB7B8" stroke-width="1" rx="3"/>'
        )
        out.append(svg_multiline(deb_stage, cx, band_top_y + band_h / 2 + 2,
                                 max_c, 11, "bold", "#1A252F"))

        # Bottom band
        out.append(
            f'<rect x="{x1}" y="{band_bot_y}" width="{w}" height="{band_h}" '
            f'fill="{bot_c}" stroke="#AAB7B8" stroke-width="1" rx="3" fill-opacity="0.78"/>'
        )
        out.append(svg_multiline(bio_stage, cx, band_bot_y + band_h / 2 + 2,
                                 max_c, 11, "bold", "white"))

    # ── Arrow line ────────────────────────────────────────────────────────────
    x_start = xp[transitions[0]]
    x_end   = xp[transitions[-1]]
    out.append(
        f'<line x1="{x_start}" y1="{timeline_y}" x2="{x_end + 12}" y2="{timeline_y}" '
        f'stroke="#2C3E50" stroke-width="3"/>'
    )
    # Arrowhead
    out.append(
        f'<polygon points="{x_end+22},{timeline_y} {x_end+10},{timeline_y-6} '
        f'{x_end+10},{timeline_y+6}" fill="#2C3E50"/>'
    )

    # ── Transition points: dots, labels, connectors ───────────────────────────
    for t in transitions:
        x = xp[t]
        dc = DOT_COLORS.get(t, "#2C3E50")

        # Dashed connectors
        out.append(
            f'<line x1="{x}" y1="{band_top_bot}" x2="{x}" y2="{timeline_y - 9}" '
            f'stroke="{dc}" stroke-width="1" stroke-dasharray="3,2" opacity="0.75"/>'
        )
        out.append(
            f'<line x1="{x}" y1="{timeline_y + 9}" x2="{x}" y2="{band_bot_y}" '
            f'stroke="{dc}" stroke-width="1" stroke-dasharray="3,2" opacity="0.75"/>'
        )

        # Dot on the arrow line
        out.append(
            f'<circle cx="{x}" cy="{timeline_y}" r="8" fill="{dc}" '
            f'stroke="white" stroke-width="2"/>'
        )

        # DEB label above band
        out.append(
            f'<text x="{x}" y="{deb_label_y}" text-anchor="middle" '
            f'font-size="12" font-weight="bold" fill="{dc}">{t}</text>'
        )

        # Biological event label below band (may wrap)
        bio_evt = get_bio_event(t, model, class_name)
        lines = wrap_text(bio_evt, 14)
        for li, line in enumerate(lines):
            out.append(
                f'<text x="{x}" y="{bio_label_y + li * 14}" text-anchor="middle" '
                f'font-size="10" fill="#2C3E50">{line}</text>'
            )

    out.append('</svg>')
    return "\n".join(out)


def build_transitions(json_path):
    """Parse a JSON file and return (class_name, model, transitions)."""
    filename = Path(json_path).name
    stem = filename.replace(".json", "")
    parts = stem.split("_")
    model = parts[-1]
    class_name = "_".join(parts[1:-1])

    if model not in MANDATORY_TRANSITIONS:
        return class_name, model, None

    with open(json_path) as f:
        data = json.load(f)

    transitions = list(MANDATORY_TRANSITIONS[model])

    # H rule — authoritative field
    if data.get("has_species_with_ah_diff_ab", False) and "H" not in transitions:
        transitions.insert(transitions.index("t0") + 1, "H")

    # Optional transitions from entity_summary (>30% threshold)
    total = data.get("total_species", 1)
    threshold = 0.30 * total
    for ent in data.get("entity_summary", []):
        name = ent.get("entity")
        count = ent.get("with_any", 0)
        trans = ENTITY_TO_TRANSITION.get(name)
        if trans and count > threshold and trans not in transitions:
            trans_idx = TRANSITION_ORDER.index(trans) if trans in TRANSITION_ORDER else 99
            inserted = False
            for j, existing in enumerate(transitions):
                ex_idx = TRANSITION_ORDER.index(existing) if existing in TRANSITION_ORDER else 99
                if trans_idx < ex_idx:
                    transitions.insert(j, trans)
                    inserted = True
                    break
            if not inserted:
                transitions.append(trans)

    return class_name, model, transitions


def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    json_files = sorted(Path(BASE_DIR).rglob("*.json"))
    success, skipped = 0, 0

    for json_path in json_files:
        class_name, model, transitions = build_transitions(str(json_path))

        if transitions is None:
            print(f"  SKIP  {json_path.name}  — unknown model '{model}'")
            skipped += 1
            continue

        svg_content = generate_svg(class_name, model, transitions)
        out_path = os.path.join(OUTPUT_DIR, f"{class_name}_{model}.svg")

        with open(out_path, "w", encoding="utf-8") as f:
            f.write(svg_content)

        print(f"  OK    {class_name}_{model}.svg   ({' → '.join(transitions)})")
        success += 1

    print(f"\nDone: {success} SVGs generated, {skipped} skipped.")
    print(f"Output folder: {OUTPUT_DIR}")


if __name__ == "__main__":
    main()
