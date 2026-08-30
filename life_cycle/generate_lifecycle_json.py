#!/usr/bin/env python3
"""
Apply the 3-step biologist prompt to all markdown files in lifecycle_markdown/
and save one JSON file per class/model to lifecycle_json/.

STEP 1  — extract transitions and stages from the markdown
STEP 2  — look up biological synonyms (class-aware)
STEP 3  — serialise to JSON following the required schema
"""

import json, sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from generate_lifecycles import build_transitions, get_bio_event, get_stage_names, BASE_DIR

MD_DIR  = Path(__file__).parent / "lifecycle_markdown"
OUT_DIR = Path(__file__).parent / "lifecycle_json"

# ── Taxonomy ──────────────────────────────────────────────────────────────────
CLASS_TO_ORDER = {
    "Actinopterygii":      "Teleostei",
    "Sarcopterygii":       "Rhipidistia",
    "Leptocardii":         "Amphioxiformes",
    "Cephalaspidomorphi":  "Petromyzontiformes",
    "Myxini":              "Myxiniformes",
    "Chondrichthyes":      "Elasmobranchii",
    "Amphibia":            "Anura / Caudata / Gymnophiona",
    "Reptilia":            "Squamata / Testudines / Crocodilia",
    "Aves":                "Neornithes",
    "Mammalia":            "Eutheria / Metatheria / Monotremata",
    "Insecta":             "Coleoptera / Diptera / Lepidoptera / Hymenoptera",
    "Entognatha":          "Collembola / Diplura / Protura",
    "Malacostraca":        "Decapoda / Isopoda / Amphipoda",
    "Hexanauplia":         "Copepoda / Cirripedia",
    "Branchiopoda":        "Cladocera / Anostraca / Notostraca",
    "Ostracoda":           "Podocopa / Myodocopa",
    "Ichthyostraca":       "Branchiura",
    "Copepoda":            "Calanoida / Cyclopoida / Harpacticoida",
    "Arachnida":           "Araneae / Acari / Scorpiones",
    "Pycnogonida":         "Pantopoda",
    "Gastropoda":          "Caenogastropoda / Vetigastropoda / Pulmonata",
    "Bivalvia":            "Ostreoida / Mytilida / Venerida",
    "Cephalopoda":         "Sepiida / Teuthida / Octopoda",
    "Polyplacophora":      "Chitonida",
    "Asteroidea":          "Forcipulatida / Valvatida",
    "Echinoidea":          "Camarodonta / Cidaroida",
    "Holothuroidea":       "Aspidochirotida / Dendrochirotida",
    "Ophiuroidea":         "Ophiurida / Euryalida",
    "Polychaeta":          "Phyllodocida / Eunicida / Sabellida",
    "Clitellata":          "Oligochaeta / Hirudinea",
    "Turbellaria":         "Tricladida / Polycladida",
    "Monogenea":           "Dactylogyridea / Gyrodactylidea",
    "Chromadorea":         "Rhabditida / Camallanida",
    "Secernentea":         "Rhabditida / Ascaridida",
    "Anopla":              "Heteronemertea",
    "Nuda":                "Hoplonemertea",
    "Anthozoa":            "Actiniaria / Scleractinia / Alcyonacea",
    "Hydrozoa":            "Hydroida / Siphonophorae",
    "Scyphozoa":           "Semaeostomeae / Rhizostomeae",
    "Cubozoa":             "Carybdeida / Chirodropida",
    "Gymnolaemata":        "Cheilostomata / Ctenostomata",
    "Ascidiacea":          "Stolidobranchia / Phlebobranchia",
    "Appendicularia":      "Copelata",
    "Thaliacea":           "Salpida / Doliolida / Pyrosomida",
    "Tentaculata":         "Cydippida / Lobata / Cestida",
    "Sagittoidea":         "Aphragmophora / Phragmophora",
    "Eutardigrada":        "Parachela / Apochela",
    "Acoelomorpha":        "Acoela / Nemertodermatida",
    "Phoronida":           "Phoronida",
    "Rhynchonellata":      "Terebratulida / Rhynchonellida",
    "Gastrotricha":        "Macrodasyida / Chaetonotida",
    "Monogononta":         "Ploima / Flosculariaceae",
    "Demospongiae":        "Verongimorpha / Keratosa",
    "Archiacanthocephala": "Moniliformida / Gigantorhynchida",
}

# Broad biological group used to select class-specific term sets
CLASS_GROUP = {
    "Actinopterygii": "fish", "Sarcopterygii": "fish", "Leptocardii": "fish",
    "Cephalaspidomorphi": "agnatha", "Myxini": "agnatha",
    "Chondrichthyes": "shark",
    "Amphibia": "amphibia", "Reptilia": "reptilia",
    "Aves": "aves", "Mammalia": "mammalia",
    "Insecta": "insecta", "Entognatha": "insecta",
    "Malacostraca": "crustacea", "Hexanauplia": "crustacea",
    "Branchiopoda": "crustacea", "Ostracoda": "crustacea",
    "Ichthyostraca": "crustacea", "Copepoda": "crustacea",
    "Arachnida": "arachnida", "Pycnogonida": "arachnida",
    "Gastropoda": "mollusca", "Bivalvia": "mollusca",
    "Cephalopoda": "mollusca", "Polyplacophora": "mollusca",
    "Asteroidea": "echinoderm", "Echinoidea": "echinoderm",
    "Holothuroidea": "echinoderm", "Ophiuroidea": "echinoderm",
    "Polychaeta": "polychaeta", "Clitellata": "annelid",
    "Turbellaria": "platyhelminth", "Monogenea": "platyhelminth",
    "Chromadorea": "nematoda", "Secernentea": "nematoda",
    "Anopla": "nemertea", "Nuda": "nemertea",
    "Anthozoa": "cnidaria", "Hydrozoa": "cnidaria",
    "Scyphozoa": "cnidaria", "Cubozoa": "cnidaria",
    "Gymnolaemata": "bryozoa",
    "Ascidiacea": "tunicata", "Appendicularia": "tunicata", "Thaliacea": "tunicata",
    "Tentaculata": "ctenophore", "Sagittoidea": "chaetognath",
    "Eutardigrada": "tardigrade", "Acoelomorpha": "acoelomorpha",
    "Phoronida": "lophophore", "Rhynchonellata": "brachiopod",
    "Gastrotricha": "gastrotricha", "Monogononta": "rotifer",
    "Demospongiae": "porifera", "Archiacanthocephala": "acanthocephala",
}

# ── STEP 2 — Term databases ───────────────────────────────────────────────────

# ── Transition: base + class-group additions ──────────────────────────────────
_T = {
    "t0": {
        "nom": {
            "default": "Fertilisation",
            "mammalia": "Internal fertilisation",
            "shark":    "Internal fertilisation",
            "aves":     "Egg fertilisation",
        },
        "base": [
            "egg fertilisation", "zygote formation", "gamete fusion",
            "syngamy", "ovum activation", "reproductive pairing",
            "zygote stage onset", "gametic union", "fecundation",
        ],
        "groups": {
            "fish":       ["external fertilisation", "broadcast spawning", "spawning event",
                           "gamete release", "oocyte fertilisation"],
            "shark":      ["internal fertilisation", "copulation", "clasper-mediated fertilisation",
                           "sperm storage", "insemination"],
            "amphibia":   ["external fertilisation", "amplexus", "egg mass fertilisation",
                           "foam nest formation"],
            "reptilia":   ["internal fertilisation", "cloacal copulation", "sperm storage"],
            "aves":       ["internal fertilisation", "cloacal kiss", "sperm competition"],
            "mammalia":   ["internal fertilisation", "copulation", "ovulation event",
                           "sperm-oocyte fusion", "insemination"],
            "insecta":    ["internal fertilisation", "spermatophore transfer",
                           "spermatheca filling", "copulation"],
            "crustacea":  ["external fertilisation", "sperm transfer", "spermatophore deposition",
                           "broadcast fertilisation"],
            "mollusca":   ["external fertilisation", "copulation", "sperm transfer",
                           "cross-fertilisation"],
            "echinoderm": ["broadcast fertilisation", "external fertilisation",
                           "chemotaxis-guided fertilisation", "gamete broadcast"],
            "cnidaria":   ["broadcast fertilisation", "gamete release", "spawning event",
                           "planula formation trigger"],
            "polychaeta": ["broadcast fertilisation", "external fertilisation",
                           "epitoky-related spawning", "gamete broadcast"],
        },
    },

    "H": {
        "nom": {
            "default": "Eclosion",
            "aves":    "Shell pipping",
            "reptilia":"Shell pipping",
        },
        "base": [
            "eclosion", "egg hatching", "chorion rupture", "eggshell hatching",
            "embryo emergence", "hatching event", "shell breaking", "larval eclosion",
        ],
        "groups": {
            "fish":       ["hatching enzyme activation", "chorionase secretion",
                           "yolk-sac larva emergence", "pre-larval emergence", "prolarva eclosion"],
            "shark":      ["egg case hatching", "mermaid's purse opening", "neonatal shark emergence"],
            "amphibia":   ["jelly capsule rupture", "gel dissolution", "aquatic larva emergence",
                           "egg mass hatching"],
            "reptilia":   ["egg tooth use", "shell pipping", "egg caruncle action",
                           "nest emergence"],
            "aves":       ["shell pipping", "egg tooth use", "chick hatching",
                           "precocial hatchling emergence", "altricial hatchling emergence"],
            "insecta":    ["neonatal larva emergence", "first instar eclosion",
                           "egg chorion rupture", "caterpillar hatching"],
            "crustacea":  ["nauplius eclosion", "nauplius hatching", "free nauplius release",
                           "egg hatching", "brood release"],
            "mollusca":   ["veliger hatching", "trochophore hatching", "larva eclosion",
                           "egg capsule hatching"],
            "echinoderm": ["larva hatching", "gastrula hatching", "free-swimming larva emergence"],
            "polychaeta": ["trochophore hatching", "pelagic larva emergence"],
            "cnidaria":   ["planula release", "planula hatching", "larval eclosion"],
        },
    },

    "G": {
        "nom": {"default": "Parturition"},
        "base": [
            "live birth", "parturition", "neonatal emergence", "delivery",
            "birth event", "viviparous birth", "offspring birth",
            "gestation completion", "uterine exit", "birth canal passage",
        ],
        "groups": {
            "mammalia": ["viviparous birth", "placental birth", "eutherian parturition",
                         "marsupial birth", "monotreme hatching"],
            "shark":    ["pup birth", "viviparous shark birth", "ovo-viviparous birth",
                         "matrotrophic birth"],
            "fish":     ["live birth", "viviparous fish birth", "brood release"],
        },
    },

    "B": {
        "nom": {
            "default":  "Onset of exogenous feeding",
            "stf":      "Live birth",
            "stx":      "Onset of lactation",
            "hep":      "Larval hatching",
            "hex":      "Larval hatching",
            "hax":      "Larval hatching",
            "mammalia": "Nursing onset",
            "aves":     "Hatching / First feeding",
        },
        "base": [
            "first exogenous feeding", "first feeding", "yolk-sac resorption",
            "mouth opening", "first prey capture", "exotrophic transition",
            "trophic switch", "active feeding onset", "larval feeding commencement",
            "yolk absorption completion",
        ],
        "groups": {
            "fish":       ["point of no return", "swim bladder inflation",
                           "exogenous nutrition onset", "mouth gape opening",
                           "retinal differentiation", "prey detection onset"],
            "shark":      ["neonatal feeding", "first prey detection", "independent foraging onset"],
            "amphibia":   ["tadpole feeding onset", "filter feeding onset",
                           "buccal grazing onset", "algal grazing start"],
            "aves":       ["parental provisioning onset", "chick first feeding",
                           "beak gape feeding", "crop filling"],
            "mammalia":   ["nursing onset", "lactation onset", "milk ingestion onset",
                           "teat attachment", "suckling onset"],
            "insecta":    ["first instar feeding", "larval host finding",
                           "plant feeding initiation", "prey ingestion onset"],
            "crustacea":  ["nauplius feeding", "phytoplankton grazing onset",
                           "filter feeding onset", "copepodite feeding"],
            "mollusca":   ["veliger feeding", "planktotrophic feeding onset",
                           "phytoplankton ingestion", "cilia-driven feeding"],
            "echinoderm": ["planktotrophic feeding onset", "ciliary feeding onset",
                           "phytoplankton grazing"],
            "polychaeta": ["trochophore feeding", "planktotrophic onset",
                           "cilia-driven feeding"],
            "cnidaria":   ["planula feeding onset", "planktotrophic larva onset",
                           "free-swimming feeding"],
        },
    },

    "S": {
        "nom": {
            "ssj": "Non-feeding phase onset",
            "default": "Onset of metabolic acceleration",
        },
        "base": [
            "developmental threshold", "growth phase transition", "larval stage shift",
            "metabolic transition event", "physiological threshold crossing",
        ],
        "groups": {
            "fish":      ["larval growth acceleration onset", "rapid growth phase onset",
                          "leptocephalus onset"],
            "crustacea": ["rapid growth phase", "copepodite transition",
                          "moulting acceleration onset"],
        },
    },

    "J": {
        "nom": {
            "default": "Larval metamorphosis",
            "ssj":     "Feeding resumption",
            "hep":     "End of larval acceleration",
            "hax":     "End of larval acceleration",
            "amphibia":"Amphibian metamorphosis",
        },
        "base": [
            "larval metamorphosis", "post-larval transformation", "larval-juvenile transition",
            "morphological transformation", "allometric shift", "body plan reorganisation",
            "juvenile recruitment", "metamorphic climax",
        ],
        "groups": {
            "fish":       ["benthic settlement", "reef settlement", "larval settlement",
                           "pelagic-benthic transition", "fin ray ossification",
                           "scale formation onset", "habitat transition"],
            "shark":      ["embryonic metamorphosis", "yolk sac absorption",
                           "juvenile shark transition"],
            "amphibia":   ["metamorphic climax", "tail resorption", "limb bud development",
                           "gill resorption", "terrestrial transition", "skin keratinisation"],
            "reptilia":   ["juvenile morphology establishment"],
            "insecta":    ["final larval instar", "imaginal disc activation",
                           "larval-adult tissue remodelling"],
            "crustacea":  ["decapodid stage", "megalopa to juvenile", "moulting metamorphosis",
                           "benthic settlement", "ecdysis event"],
            "mollusca":   ["larval settlement", "substratum attachment",
                           "metamorphic competence", "velum loss", "gill development"],
            "echinoderm": ["larval settlement", "metamorphic competence", "arm resorption",
                           "substratum attachment", "adult rudiment development"],
            "polychaeta": ["nectochaete settlement", "benthic recruitment", "juvenile worm"],
            "cnidaria":   ["planula settlement", "polyp formation", "metamorphic settlement",
                           "primary polyp formation"],
            "tunicata":   ["tadpole settlement", "metamorphic resorption", "tail resorption",
                           "sessile juvenile formation"],
        },
    },

    "X": {
        "nom": {
            "aves":    "Fledgling independence",
            "default": "Weaning",
        },
        "base": [
            "parental provisioning end", "nutritional independence onset",
            "dietary transition", "provisioning cessation",
        ],
        "groups": {
            "mammalia": ["weaning", "lactation cessation", "milk independence",
                         "solid food transition", "nutritional emancipation",
                         "suckling end"],
            "aves":     ["fledgling", "first flight achievement", "parental independence",
                         "post-fledging dispersal", "nest departure",
                         "flight feather maturation"],
        },
    },

    "P": {
        "nom": {
            "default": "Sexual maturation",
            "abp":     "Puberty and growth cessation",
            "sbp":     "Puberty and growth cessation",
            "hep":     "Larval puberty",
            "hex":     "Pupation trigger",
            "hax":     "Pupation trigger",
        },
        "base": [
            "sexual maturation", "reproductive maturity", "first reproduction event",
            "gonad maturation", "puberty", "gametogenesis onset",
            "reproductive activation", "age at first reproduction",
        ],
        "groups": {
            "fish":       ["first spawning", "vitellogenesis onset", "spermiation onset",
                           "HPG axis activation", "gonadal recrudescence"],
            "shark":      ["first pupping", "testicular recrudescence", "ovarian maturation"],
            "amphibia":   ["first amplexus", "gonadal maturation", "first egg deposition"],
            "reptilia":   ["first egg clutch", "gonadal activation", "first copulation"],
            "aves":       ["first breeding", "first clutch laying", "gonadal swelling",
                           "testosterone surge"],
            "mammalia":   ["first oestrus", "first ovulation", "puberty onset",
                           "first oestrous cycle", "testicular descent"],
            "insecta":    ["adult reproductive activation", "oocyte maturation",
                           "first egg laying", "reproductive imaginal stage"],
            "crustacea":  ["first egg clutch", "first ovigerous female",
                           "first mating", "gonad maturation"],
            "mollusca":   ["first spawning", "first egg mass deposition",
                           "gonad maturation", "reproductive season onset"],
            "echinoderm": ["first spawning", "gonad maturation", "reproductive readiness"],
            "cnidaria":   ["first budding", "first polyp reproduction",
                           "first medusa release", "first strobilation"],
        },
    },

    "U": {
        "nom": {"default": "Pupal eclosion"},
        "base": [
            "pupal completion", "pharate adult stage", "pupal eclosion",
            "holometabolic reorganisation end", "puparium opening",
            "pupal development completion", "imaginal differentiation end",
            "adult histogenesis completion", "pupal case rupture",
        ],
        "groups": {
            "insecta": ["puparium eclosion", "chrysalis opening", "adult disc eversion",
                        "imaginal disc differentiation", "pupation completion"],
        },
    },

    "E": {
        "nom": {"default": "Imago emergence"},
        "base": [
            "imago emergence", "adult eclosion", "imaginal eclosion",
            "winged adult emergence", "final moult", "adult form emergence",
            "reproductive adult appearance", "post-pupal emergence",
        ],
        "groups": {
            "insecta": ["imaginal eclosion", "emergence from puparium",
                        "wing expansion", "cuticle hardening",
                        "sclerotisation onset", "teneral adult"],
        },
    },

    "M": {
        "nom": {"default": "Natural death"},
        "base": [
            "natural mortality", "senescence", "age-related death",
            "post-reproductive mortality", "biological death", "somatic death",
            "lifespan completion", "ecological mortality", "organismal death",
            "reproductive senescence", "physiological death",
        ],
        "groups": {
            "fish":    ["post-spawning death", "semelparous death", "senescent adult death"],
            "insecta": ["imago death", "post-mating death", "senescent imago"],
            "mammalia":["geriatric death", "senile mortality"],
            "aves":    ["post-breeding mortality", "senescent adult mortality"],
        },
    },
}

# ── Stage: base + class-group additions ──────────────────────────────────────
_S = {
    ("Embryo", "Egg"): {
        "nom": {
            "default": "Embryonated egg",
            "fish":    "Pelagic or demersal egg",
            "aves":    "Incubated egg",
            "reptilia":"Leathery-shelled egg",
        },
        "note": {
            "fish":    "Teleost eggs may be pelagic (buoyant, transparent) or demersal (adhesive, benthic); all are enclosed in a chorion.",
            "aves":    "Bird eggs have a calcareous shell; embryo is sustained by yolk and albumen during external incubation.",
            "reptilia":"Reptile eggs typically have a leathery or calcified shell; embryonic development is temperature-sensitive.",
            "insecta": "Insect eggs are protected by a chorion with micropyles for sperm entry; they may be deposited singly or in masses.",
        },
        "base": [
            "fertilised ovum", "embryonated egg", "incubating egg", "yolk-laden egg",
            "chorionate embryo", "cleavage-stage embryo", "blastula-stage embryo",
            "gastrulating embryo", "yolk-dependent embryo",
        ],
        "groups": {
            "fish":       ["pelagic egg", "demersal egg", "adhesive egg", "eyed egg",
                           "teleost embryo", "transparent egg"],
            "shark":      ["meroblastic egg", "large yolky egg", "intrauterine egg",
                           "ovo-viviparous embryo"],
            "amphibia":   ["jelly-coated egg", "gelatinous egg mass", "aquatic egg",
                           "melanised egg"],
            "reptilia":   ["leathery-shelled egg", "amniote egg", "parchment-shelled egg",
                           "cleidoic egg"],
            "aves":       ["calcareous egg", "amniote egg", "incubated egg",
                           "albumen-surrounded embryo"],
            "insecta":    ["chorionate egg", "insect ovum", "egg pod member",
                           "micropylar egg"],
            "crustacea":  ["brood egg", "nauplius egg", "subitaneous egg",
                           "resting egg", "ephippium"],
            "mollusca":   ["egg capsule content", "veliger precursor egg",
                           "spawn egg", "benthic egg mass"],
            "echinoderm": ["planktotrophic egg", "lecithotrophic egg",
                           "broadcast egg", "small transparent egg"],
            "polychaeta": ["benthic egg", "pelagic egg", "trochophore precursor"],
            "cnidaria":   ["planula precursor", "fertilised cnidarian egg",
                           "brooded egg"],
        },
    },

    ("Embryo", "Egg / Incubation"): {
        "nom": {
            "default": "Embryo under incubation",
            "aves":    "Incubated amniote egg",
            "reptilia":"Incubated cleidoic egg",
        },
        "base": [
            "fertilised ovum", "incubating egg", "embryonated egg",
            "yolk-dependent embryo", "cleavage-stage embryo",
            "blastula-stage embryo", "gastrulating embryo", "organogenesis stage",
        ],
        "groups": {
            "fish":       ["pelagic egg", "demersal egg", "adhesive egg", "eyed egg",
                           "teleost embryo"],
            "amphibia":   ["jelly-coated egg", "aquatic egg", "melanised embryo",
                           "egg mass embryo"],
            "reptilia":   ["leathery-shelled egg", "cleidoic egg", "parchment egg",
                           "incubated reptile egg"],
            "aves":       ["calcareous egg", "incubated bird egg", "amniote embryo",
                           "albumen-buffered embryo"],
            "insecta":    ["chorionate egg", "desiccation-resistant egg",
                           "diapause egg"],
            "crustacea":  ["brood egg", "subitaneous egg", "dormant resting egg"],
        },
    },

    ("Embryo", "Gestation (in utero)"): {
        "nom": {"default": "Intrauterine embryo"},
        "base": [
            "intrauterine embryo", "foetal stage", "embryo in utero",
            "viviparous embryo", "placental embryo", "embryogenesis stage",
            "organogenesis in utero", "gestating embryo",
        ],
        "groups": {
            "mammalia": ["placental foetus", "yolk sac foetus", "villous chorion stage",
                         "foetal membrane stage", "allantoic stage"],
            "shark":    ["placental shark embryo", "matrotroph embryo",
                         "uterine embryo", "aplacental viviparous embryo"],
            "fish":     ["intrauterine embryo", "viviparous fish embryo"],
        },
    },

    ("Embryo", "Gestation"): {
        "nom": {"default": "Gestating embryo"},
        "base": [
            "gestating embryo", "embryo during gestation", "in utero embryo",
            "foetal development stage", "uterine embryo", "embryogenesis",
            "organogenesis", "embryo growth phase",
        ],
        "groups": {
            "mammalia": ["placental foetus", "eutherian foetus", "marsupial pouch embryo",
                         "foetal membrane stage"],
            "shark":    ["uterine embryo", "matrotroph embryo", "embryo with yolk sac"],
        },
    },

    ("Embryo", "Pre-feeding larva"): {
        "nom": {
            "default": "Yolk-sac larva",
            "fish":    "Yolk-sac larva (alevin)",
        },
        "note": {
            "fish": "The yolk-sac larva has hatched but the mouth and digestive tract are not yet functional for exogenous feeding; survival depends entirely on endogenous yolk.",
        },
        "base": [
            "yolk-sac larva", "endotrophic larva", "lecithotrophic larva",
            "yolk-dependent larva", "non-feeding larva", "yolk absorption stage",
        ],
        "groups": {
            "fish":       ["alevin", "protolarva", "prolarva", "yolk-sac fry",
                           "sac-fry", "pre-first-feeding larva", "mouth-closed larva"],
            "amphibia":   ["yolk-dependent tadpole", "endotrophic tadpole",
                           "pre-feeding tadpole"],
        },
    },

    ("Neonate", "Neonatal"): {
        "nom": {
            "default": "Newborn / Neonate",
            "mammalia":"Neonatal mammal",
        },
        "base": [
            "newborn", "neonate", "neonatal individual", "newborn offspring",
            "newborn animal", "post-natal neonate", "birth-stage individual",
            "neonatal stage", "dependent newborn",
        ],
        "groups": {
            "mammalia": ["neonatal mammal", "precocial neonate", "altricial neonate",
                         "joey (marsupial)", "pup", "cub", "kit", "fawn", "calf"],
            "shark":    ["neonatal shark", "shark pup", "newborn elasmobranch"],
        },
    },

    ("Juvenile (Nursing)", "Suckling / Nursing"): {
        "nom": {"default": "Suckling juvenile"},
        "base": [
            "suckling juvenile", "nursing offspring", "milk-dependent young",
            "lactating female's offspring", "nursing stage", "suckling stage",
            "pre-weaning juvenile", "altricial dependent young",
        ],
        "groups": {
            "mammalia": ["suckling mammal", "nursing pup", "suckling calf", "kit",
                         "pre-weaning pup", "lactation-dependent offspring"],
        },
    },

    ("Juvenile (Parental care)", "Nestling"): {
        "nom": {"default": "Nestling chick"},
        "base": [
            "nestling", "chick", "altricial nestling", "precocial chick",
            "nest-dependent chick", "brooded nestling", "parental-fed chick",
            "developing chick", "feather-growing nestling",
        ],
        "groups": {
            "aves": ["altricial nestling", "semi-precocial chick", "downy chick",
                     "nestling bird", "pin-feathered chick", "fledgling precursor"],
        },
    },

    ("Larva (Acceleration)", "Larval stage"): {
        "nom": {
            "default": "Free-swimming larva",
            "fish":    "Pelagic teleost larva",
            "insecta": "Feeding larval instar",
            "crustacea": "Planktonic crustacean larva",
            "mollusca":  "Veliger larva",
            "echinoderm":"Bipinnaria / Pluteus larva",
            "polychaeta":"Trochophore larva",
            "cnidaria":  "Planula larva",
            "tunicata":  "Tadpole larva",
            "amphibia":  "Aquatic tadpole",
        },
        "base": [
            "free-swimming larva", "planktonic larva", "exogenously feeding larva",
            "actively growing larva", "pre-metamorphic larva",
        ],
        "groups": {
            "fish":       ["planktonic larva", "ichthyoplankton", "pelagic larva",
                           "preflexion larva", "flexion-stage larva", "postflexion larva",
                           "teleost larva", "finfish larva", "exotrophic larva",
                           "pelagic larval phase"],
            "shark":      ["embryonic larva", "oophagous embryo", "intrauterine larva"],
            "amphibia":   ["tadpole", "aquatic larva", "larval amphibian",
                           "gill-breathing larva", "herbivorous tadpole",
                           "filter-feeding tadpole", "Gosner-stage larva"],
            "insecta":    ["larval instar", "caterpillar", "grub", "maggot",
                           "feeding larva", "leaf-mining larva", "soil larva",
                           "wood-boring larva"],
            "crustacea":  ["nauplius larva", "metanauplius", "zoea larva",
                           "megalopa larva", "copepodite", "cypris larva",
                           "furcilia larva", "calyptopis", "phyllosoma"],
            "mollusca":   ["veliger larva", "trochophore larva", "pediveliger",
                           "planktotrophic larva", "glochidium",
                           "prodissoconch stage"],
            "echinoderm": ["bipinnaria larva", "pluteus larva", "auricularia larva",
                           "ophiopluteus larva", "doliolaria larva",
                           "planktotrophic echinoderm larva", "bilateral larva"],
            "polychaeta": ["trochophore larva", "nectochaete larva",
                           "metatrochophore", "pelagic polychaete larva"],
            "cnidaria":   ["planula larva", "ciliated larva", "ephyra",
                           "actinula larva", "creeping planula"],
            "tunicata":   ["tadpole larva", "notochord-bearing larva",
                           "free-swimming tunicate larva", "lecithotrophic larva"],
            "bryozoa":    ["cyphonautes larva", "coronate larva", "free-swimming larva"],
            "arachnida":  ["larval stage", "hexapod larva", "protonymphal stage"],
            "annelid":    ["trochophore larva", "pilidium larva", "planktonic larva"],
            "nemertea":   ["pilidium larva", "Desor larva", "planktotrophic larva"],
            "nematoda":   ["first-stage larva", "L1 larva", "dauerlarvae"],
            "platyhelminth": ["müller's larva", "Götte's larva", "free-swimming larva"],
        },
    },

    ("Larva (Acceleration)", "Accelerating larval stage"): {
        "nom": {"default": "Accelerating larva"},
        "base": [
            "accelerating larva", "rapidly growing larva", "planktonic larva",
            "exogenously feeding larva", "pre-metamorphic larva",
        ],
        "groups": {
            "fish":       ["pelagic larva", "ichthyoplankton", "teleost larva",
                           "actively growing larva"],
            "crustacea":  ["nauplius larva", "copepodite larva", "zoea larva",
                           "planktonic crustacean larva"],
            "mollusca":   ["veliger larva", "trochophore larva", "planktotrophic larva"],
            "echinoderm": ["pluteus larva", "bipinnaria larva", "planktotrophic larva"],
            "tunicata":   ["tadpole larva", "free-swimming larva"],
        },
    },

    ("Shrinking stage", "Non-feeding shrinking"): {
        "nom": {"default": "Non-feeding shrinking stage"},
        "note": {
            "default": "This metabolically controlled phase involves active catabolism beyond starvation; found in eels (leptocephalus-to-glass eel transition) and some echinoderms.",
        },
        "base": [
            "non-feeding stage", "shrinking larva", "controlled catabolism stage",
            "leptocephalus stage", "non-trophic phase", "body mass reduction stage",
            "metabolic reorganisation phase", "anorexic larval phase",
        ],
        "groups": {
            "fish":      ["leptocephalus larva", "glass eel transition",
                          "metamorphic shrinking larva", "leptocephalus-to-elver"],
            "echinoderm":["non-feeding larva", "lecithotrophic transition stage"],
        },
    },

    ("Juvenile", "Early juvenile"): {
        "nom": {"default": "Early juvenile"},
        "base": [
            "early juvenile", "young juvenile", "post-larval juvenile",
            "pre-shrinking juvenile", "immature juvenile",
            "recently settled juvenile", "small juvenile",
        ],
        "groups": {
            "fish":      ["fingerling", "post-larval fish", "newly settled juvenile"],
            "crustacea": ["early benthic juvenile", "post-settlement juvenile"],
        },
    },

    ("Larva", "Early larval stage"): {
        "nom": {"default": "Early larva"},
        "base": [
            "early larva", "first larval stage", "pre-acceleration larva",
            "early instar larva", "young larva", "initial larval stage",
        ],
        "groups": {
            "fish":      ["preflexion larva", "early teleost larva", "early pelagic larva"],
            "crustacea": ["nauplius larva", "early nauplius", "first nauplius instar"],
            "insecta":   ["first instar larva", "early caterpillar", "early grub"],
        },
    },

    ("Juvenile", "Juvenile"): {
        "nom": {
            "default":   "Juvenile",
            "fish":      "Juvenile fish",
            "amphibia":  "Terrestrial juvenile",
            "insecta":   "Nymph",
            "crustacea": "Juvenile crustacean",
        },
        "base": [
            "juvenile", "sub-adult", "immature individual",
            "young individual", "pre-reproductive juvenile",
            "growing juvenile", "immature organism",
        ],
        "groups": {
            "fish":       ["fingerling", "fry", "parr", "smolt", "post-settlement juvenile",
                           "young-of-year", "immature fish"],
            "shark":      ["juvenile shark", "pup", "sub-adult shark"],
            "amphibia":   ["froglet", "toadlet", "eft", "juvenile amphibian",
                           "terrestrial juvenile"],
            "reptilia":   ["hatchling", "juvenile reptile", "young-of-year reptile"],
            "aves":       ["fledgling", "juvenile bird", "immature bird",
                           "first-year bird", "subadult bird"],
            "mammalia":   ["juvenile mammal", "sub-adult mammal", "weaned juvenile",
                           "post-weaning young"],
            "insecta":    ["nymph", "larval instar", "juvenile hemimetabolous",
                           "pre-adult insect"],
            "crustacea":  ["juvenile crustacean", "early benthic phase",
                           "post-larval crustacean", "crablet", "shrimp juvenile"],
            "mollusca":   ["juvenile mollusc", "post-larval mollusc",
                           "settling juvenile", "early spat"],
            "echinoderm": ["juvenile echinoderm", "post-metamorphic juvenile",
                           "young sea urchin", "young starfish"],
            "polychaeta": ["juvenile worm", "young polychaete", "early benthic juvenile"],
            "cnidaria":   ["primary polyp", "young polyp", "juvenile medusa",
                           "newly settled polyp"],
            "arachnida":  ["nymph", "protonymph", "deutonymph", "tritonymph"],
        },
    },

    ("Juvenile (Accel.)", "Larval-juvenile stage"): {
        "nom": {"default": "Accelerating larval-juvenile"},
        "base": [
            "larval-juvenile stage", "accelerating juvenile",
            "combined larval-juvenile phase", "rapid-growth juvenile",
            "pre-pubertal accelerating stage",
        ],
        "groups": {
            "crustacea": ["copepodite stage", "accelerating copepodite",
                          "juvenile copepod", "pre-adult copepod"],
            "insecta":   ["larval instar", "feeding larva with acceleration",
                          "pre-pupal larva"],
        },
    },

    ("Larva (Allocation)", "Larval stage"): {
        "nom": {"default": "Allocation larva (holometabola)"},
        "base": [
            "feeding larva", "allocation larva", "reproduction-buffer larva",
            "holometabolous larva", "pre-pupal larva",
        ],
        "groups": {
            "insecta": ["caterpillar", "grub", "maggot", "larval instar",
                        "feeding holometabolan larva", "leaf-mining larva",
                        "wood-boring larva"],
        },
    },

    ("Juvenile", "Post-metamorphosis juv."): {
        "nom": {
            "default": "Post-metamorphic juvenile",
            "fish":    "Juvenile fish (post-settlement)",
            "amphibia":"Terrestrial juvenile amphibian",
        },
        "base": [
            "post-metamorphic juvenile", "juvenile", "sub-adult",
            "immature post-metamorphic", "recruits",
            "recently metamorphosed juvenile", "growing juvenile",
        ],
        "groups": {
            "fish":       ["fingerling", "parr", "young-of-year", "post-settlement juvenile",
                           "benthic juvenile", "immature teleost"],
            "amphibia":   ["froglet", "toadlet", "metamorphling", "eft",
                           "terrestrial juvenile"],
            "crustacea":  ["post-larval crustacean", "early benthic juvenile",
                           "crablet", "juvenile shrimp"],
            "mollusca":   ["spat", "post-larval mollusc", "juvenile bivalve",
                           "juvenile gastropod"],
            "echinoderm": ["juvenile sea urchin", "juvenile starfish",
                           "post-metamorphic echinoderm"],
        },
    },

    ("Larva (adult phase)", "Late larva"): {
        "nom": {"default": "Late larva (adult-phase)"},
        "base": [
            "late larva", "final larval instar", "adult-phase larva",
            "pre-emergence larva", "physiologically adult larva",
        ],
        "groups": {
            "insecta": ["final instar larva", "wandering larva", "last instar nymph",
                        "pre-imago larva", "subimago precursor"],
        },
    },

    ("Larva (no accel.)", "Late larval stage"): {
        "nom": {"default": "Late larva (non-accelerating)"},
        "base": [
            "late larval stage", "post-puberty larva", "pre-pupal larva",
            "non-accelerating late larva", "wandering larva",
        ],
        "groups": {
            "insecta": ["wandering larva", "prepupal larva", "post-feeding larva",
                        "late instar larva", "fat-body-rich larva"],
        },
    },

    ("Pre-pupa", "Pre-pupal stage"): {
        "nom": {"default": "Prepupa"},
        "base": [
            "prepupa", "pre-pupal stage", "wandering larva", "late larval stage",
            "pre-pupation stage", "pre-metamorphic resting stage",
            "feeding cessation stage",
        ],
        "groups": {
            "insecta": ["pupation preparatory stage", "spinning larva",
                        "spinning caterpillar", "wandering grub"],
        },
    },

    ("Pupa", "Pupal stage"): {
        "nom": {"default": "Pupa"},
        "note": {
            "default": "The pupa is a non-feeding quiescent stage during which larval tissues are histolysed and adult structures (imaginal discs) differentiate; characteristic of holometabolous insects.",
        },
        "base": [
            "pupa", "chrysalis", "puparium", "resting stage",
            "holometabolic pupa", "quiescent stage", "non-feeding pupa",
            "metamorphic resting stage",
        ],
        "groups": {
            "insecta": ["chrysalis", "puparium", "coarctate pupa", "obtect pupa",
                        "exarate pupa", "histolysis stage", "imaginal disc expansion"],
        },
    },

    ("Eclosion", "Emergence"): {
        "nom": {"default": "Adult eclosion"},
        "base": [
            "adult eclosion", "imaginal eclosion", "pupal eclosion event",
            "emergence from puparium", "cuticle-splitting emergence",
            "holometabolic emergence",
        ],
        "groups": {
            "insecta": ["wing expansion phase", "teneral adult stage",
                        "sclerotisation onset", "emergence from chrysalis"],
        },
    },

    ("Imago", "Winged adult"): {
        "nom": {"default": "Imago (winged adult)"},
        "base": [
            "imago", "winged adult", "perfect insect", "adult stage",
            "reproductive adult", "non-growing adult", "post-emergence adult",
        ],
        "groups": {
            "insecta": ["flying adult", "reproductive imago", "mating adult",
                        "dispersing imago", "swarming adult"],
        },
    },

    ("Imago", "Winged adult (imago)"): {
        "nom": {"default": "Imago (winged adult)"},
        "base": [
            "imago", "winged adult", "perfect insect",
            "adult insect", "post-emergence adult", "reproductive imago",
        ],
        "groups": {
            "insecta": ["flying adult", "reproductive imago", "mating adult",
                        "dispersing imago", "swarming adult"],
        },
    },

    ("Adult", "Breeding adult"): {
        "nom": {
            "default":   "Reproductively active adult",
            "fish":      "Spawning adult",
            "mammalia":  "Breeding adult mammal",
            "aves":      "Breeding adult bird",
            "insecta":   "Reproductive adult insect",
            "crustacea": "Ovigerous adult crustacean",
        },
        "base": [
            "sexually mature adult", "reproductively active adult",
            "breeding individual", "gravid individual",
            "post-pubertal adult", "reproductively viable organism",
        ],
        "groups": {
            "fish":       ["spawning adult", "gravid fish", "mature teleost",
                           "iteroparous adult", "semelparous adult",
                           "nest-guarding adult", "sexually mature fish"],
            "shark":      ["gravid female shark", "mature elasmobranch",
                           "reproductively active shark"],
            "amphibia":   ["breeding frog", "breeding salamander",
                           "gravid female amphibian", "amplexing adult"],
            "reptilia":   ["gravid female reptile", "egg-laying adult",
                           "nesting female", "oviparous adult"],
            "aves":       ["breeding bird", "nesting adult", "incubating adult",
                           "provisioning adult", "territorial adult"],
            "mammalia":   ["breeding adult mammal", "lactating female",
                           "gravid female", "territorial male",
                           "sexually active adult"],
            "insecta":    ["egg-laying female", "ovipositing female",
                           "territorial male insect", "mating adult"],
            "crustacea":  ["ovigerous female", "egg-bearing female",
                           "berried female", "gravid crustacean",
                           "brooding adult"],
            "mollusca":   ["spawning mollusc", "egg-laying adult",
                           "gravid mollusc", "brooding adult"],
            "echinoderm": ["spawning adult", "gravid adult echinoderm"],
            "cnidaria":   ["budding polyp", "reproductive medusa",
                           "strobilating scyphozoan", "gonozooid"],
        },
    },
}

# ── Helper functions ──────────────────────────────────────────────────────────

def _merge(base, group_dict, group):
    """Deduplicated list: base terms + class-group additions."""
    extra = group_dict.get(group, [])
    seen, out = set(), []
    for t in base + extra:
        if t not in seen:
            seen.add(t)
            out.append(t)
    return out


def trans_nom(t, model, class_name, grp):
    d = _T[t]["nom"]
    # Check model-specific first, then group, then default
    if model in d:          return d[model]
    if class_name in d:     return d[class_name]
    if grp in d:            return d[grp]
    return d.get("default", t)


def trans_terms(t, model, class_name, grp):
    d = _T[t]
    return _merge(d["base"], d.get("groups", {}), grp)


def stage_nom(key, class_name, grp):
    d = _S.get(key, {})
    nom_d = d.get("nom", {})
    if class_name in nom_d: return nom_d[class_name]
    if grp in nom_d:        return nom_d[grp]
    return nom_d.get("default", key[1])


def stage_note(key, class_name, grp):
    d = _S.get(key, {})
    note_d = d.get("note", {})
    if class_name in note_d: return note_d[class_name]
    if grp in note_d:        return note_d[grp]
    return note_d.get("default", None)


def stage_terms(key, class_name, grp):
    d = _S.get(key, {})
    base = d.get("base", [key[1]])
    return _merge(base, d.get("groups", {}), grp)

# ── JSON builder ──────────────────────────────────────────────────────────────

MODEL_LABELS = {
    "std":  "Standard DEB model",
    "stf":  "std with foetal development (viviparous)",
    "stx":  "stf with baby stage and weaning",
    "ssj":  "std with non-feeding shrinking stage",
    "sbp":  "std with growth ceasing at puberty",
    "abj":  "std with type M metabolic acceleration",
    "asj":  "abj with delayed start of acceleration",
    "abp":  "abj with growth ceasing at puberty",
    "hep":  "DEB model for hemimetabolic insects",
    "hex":  "DEB model for holometabolic insects",
    "hax":  "Hybrid model for Diptera",
}


def build_json(class_name, model, transitions):
    grp = CLASS_GROUP.get(class_name, "default")

    stades = []
    sid = 1

    for i, t in enumerate(transitions):
        bio_event = get_bio_event(t, model, class_name)

        entry = {
            "id":     sid,
            "label":  t,
            "nom":    trans_nom(t, model, class_name, grp),
            "type":   "transition",
            "termes": trans_terms(t, model, class_name, grp),
        }
        stades.append(entry)
        sid += 1

        if i < len(transitions) - 1:
            t2 = transitions[i + 1]
            deb_stage, bio_stage = get_stage_names(t, t2, model, class_name)
            key = (deb_stage, bio_stage)

            s_entry = {
                "id":     sid,
                "label":  bio_stage,
                "nom":    stage_nom(key, class_name, grp),
                "type":   "stade",
                "termes": stage_terms(key, class_name, grp),
            }
            note = stage_note(key, class_name, grp)
            if note:
                s_entry["note"] = note
            stades.append(s_entry)
            sid += 1

    key_name = f"{class_name}_{model}_cycle_de_vie"
    return {
        key_name: {
            "titre":  (f"Life cycle of class {class_name}"
                       f" — {model.upper()} ({MODEL_LABELS.get(model, model)})"),
            "ordre":  CLASS_TO_ORDER.get(class_name, "—"),
            "classe": class_name,
            "stades": stades,
        }
    }

# ── Main ──────────────────────────────────────────────────────────────────────

def main():
    OUT_DIR.mkdir(exist_ok=True)

    md_files = sorted(MD_DIR.glob("*.md"))
    success = skipped = 0

    for md in md_files:
        stem  = md.stem                       # e.g. "Actinopterygii_abj"
        parts = stem.split("_")
        model = parts[-1]
        class_name = "_".join(parts[:-1])

        # locate source JSON in summary_by_model
        matches = list(Path(BASE_DIR).rglob(f"summary_{stem}.json"))
        if not matches:
            print(f"  SKIP  {md.name}  — no source JSON found")
            skipped += 1
            continue

        class_name_ret, model_ret, transitions = build_transitions(str(matches[0]))
        if transitions is None:
            print(f"  SKIP  {md.name}  — unknown model '{model}'")
            skipped += 1
            continue

        payload = build_json(class_name_ret, model_ret, transitions)
        out = OUT_DIR / f"{stem}.json"
        out.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")

        print(f"  OK    {out.name}   ({' → '.join(transitions)})")
        success += 1

    print(f"\nDone: {success} JSON files written, {skipped} skipped.")
    print(f"Output folder: {OUT_DIR}")


if __name__ == "__main__":
    main()
