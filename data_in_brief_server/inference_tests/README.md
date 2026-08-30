# inference_tests

A quick notebook that runs the trained NER checkpoint on raw text and prints the
trait entities it extracts (TYPE / TEXT).

## Structure

```
inference_tests/
├── ner_infer.py       # shared inference logic (import-only, no src/ dependency)
├── inference.ipynb    # two-line notebook: import ner_infer, then extract_and_show()
└── README.md
```

All the logic lives in `ner_infer.py`, so there's one copy to maintain.

## How to run

Open `inference.ipynb` in Jupyter/VS Code and **Run All**. Requirements: `torch` +
`transformers`. It reads the model from `../outputs/bio/bert/baseline/final_model/`
and needs no internet — the label set is read from the saved model's own config.

## Test text

The notebook defaults to a passage defined once as `ner_infer.DEFAULT_TEXT` — edit
it there to change the text. To try a one-off text without editing the file, pass
`text="..."`. To trade recall for precision, pass `threshold=0.9`. Re-run
**Restart & Run All** after changing the text to refresh the saved outputs.
