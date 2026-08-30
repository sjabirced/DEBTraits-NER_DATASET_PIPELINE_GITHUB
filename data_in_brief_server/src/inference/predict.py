"""Run the trained NER model on new, unlabeled text and extract trait entities.

This is the end deliverable of the project: take the trained bert-base-cased
BIO checkpoint from outputs/ and use it to annotate raw text that has no
existing labels.

Usage:
    python src/inference/predict.py \
        --model_dir outputs/bio/bert/baseline/final_model \
        --input_file new_species_description.txt \
        --output_file predictions.json
"""
import argparse
import json
import re
import sys
from pathlib import Path
from typing import Optional

import torch
from transformers import AutoModelForTokenClassification, AutoTokenizer

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "training"))
from common import apply_threshold, load_yaml, tags_to_spans  # noqa: E402

REPO_ROOT = Path(__file__).resolve().parent.parent.parent

_SENTENCE_SPLIT = re.compile(r"(?<=[.!?])\s+")

# Keeps decimal numbers intact ("18.9", "0.87") while splitting off punctuation
# (commas, hyphens, periods) as their own tokens — matching how the training
# data's "tokens" field was built (e.g. "small", "-", "bodied" as 3 tokens).
# Without this, tokenizing raw text directly would let the pretokenizer split
# "18.9" into 3 separate words (18 / . / 9), each getting an independent
# prediction the model was never actually trained to make — a real problem for
# this dataset since most entities (Li, Lp, Wwi, Wwb, Wwp, tR, tg, tp, tx) are
# numeric measurements.
_WORD_PATTERN = re.compile(r"\d+(?:[.,]\d+)*|\w+|[^\w\s]")


def split_sentences(text: str) -> list[str]:
    return [s for s in _SENTENCE_SPLIT.split(text.strip()) if s]


def tokenize_with_offsets(sentence: str) -> tuple[list[str], list[tuple[int, int]]]:
    words, offsets = [], []
    for match in _WORD_PATTERN.finditer(sentence):
        words.append(match.group())
        offsets.append((match.start(), match.end()))
    return words, offsets


def predict_sentence(
    sentence: str,
    tokenizer,
    model,
    id2label: dict,
    device: str,
    max_length: int,
    o_label_id: int,
    threshold: Optional[float] = None,
) -> list[dict]:
    words, word_char_offsets = tokenize_with_offsets(sentence)
    if not words:
        return []

    encoding = tokenizer(
        words,
        is_split_into_words=True,
        return_tensors="pt",
        truncation=True,
        max_length=max_length,
    )
    word_ids = encoding.word_ids(batch_index=0)
    model_inputs = {k: v.to(device) for k, v in encoding.items()}

    with torch.no_grad():
        logits = model(**model_inputs).logits[0]
    if threshold is not None:
        pred_ids = apply_threshold(logits, o_label_id, threshold).tolist()
    else:
        pred_ids = logits.argmax(dim=-1).tolist()

    # Only the first subword of each word carries a real prediction — that's
    # the only position the model was ever trained on (the rest were masked
    # with -100 during training), so scoring every subword would corrupt
    # spans with noise from never-supervised positions.
    seen = set()
    tags, offsets = [], []
    for i, wid in enumerate(word_ids):
        if wid is None or wid in seen:
            continue
        seen.add(wid)
        tags.append(id2label[pred_ids[i]])
        offsets.append(word_char_offsets[wid])

    return tags_to_spans(tags, offsets)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--model_dir", required=True, help="path to a saved final_model/ directory")
    parser.add_argument("--config_dir", default=str(REPO_ROOT / "configs"))
    parser.add_argument("--input_file", required=True, help="raw text file to annotate")
    parser.add_argument("--output_file", default=None, help="write JSON here instead of stdout")
    parser.add_argument(
        "--threshold", type=float, default=None,
        help="only commit to a non-O prediction if its confidence clears this (0-1); "
             "default is plain argmax. Trades recall for precision without retraining.",
    )
    args = parser.parse_args()

    scheme_cfg = load_yaml(Path(args.config_dir) / "scheme" / "bio.yaml")
    label_mapping = json.loads((REPO_ROOT / scheme_cfg["label_mapping"]).read_text())
    id2label = {int(k): v for k, v in label_mapping["id2label"].items()}
    o_label_id = label_mapping["label2id"]["O"]

    # add_prefix_space keeps is_split_into_words=True consistent with how the
    # BERT WordPiece tokenizer handles pre-split words.
    tokenizer = AutoTokenizer.from_pretrained(args.model_dir, add_prefix_space=True)
    model = AutoModelForTokenClassification.from_pretrained(args.model_dir)
    model.eval()
    device = "cuda" if torch.cuda.is_available() else "cpu"
    model.to(device)

    # tokenizer.model_max_length can be unreliable across checkpoints; cap it by
    # the model's positional limit so an unusually long sentence truncates
    # instead of crashing.
    max_length = min(tokenizer.model_max_length, model.config.max_position_embeddings)

    text = Path(args.input_file).read_text()
    sentences = split_sentences(text)

    results = []
    for sent_idx, sentence in enumerate(sentences):
        spans = predict_sentence(
            sentence, tokenizer, model, id2label, device, max_length, o_label_id, args.threshold,
        )
        for span in spans:
            results.append({
                "sentence_index": sent_idx,
                "sentence": sentence,
                "type": span["type"],
                "text": sentence[span["start"]:span["end"]],
                "start_char": span["start"],
                "end_char": span["end"],
            })

    output = json.dumps(results, indent=2, ensure_ascii=False)
    if args.output_file:
        Path(args.output_file).write_text(output)
        print(f"Wrote {len(results)} entities to {args.output_file}")
    else:
        print(output)


if __name__ == "__main__":
    main()
