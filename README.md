# Team 6 — Lifestyle Archetypes and Problematic Internet Use

Identifying lifestyle archetypes associated with problematic internet use (PIU) in children
and adolescents, using unsupervised learning on sleep, physical activity and body composition
data from the Child Mind Institute's Healthy Brain Network study.

## Project question

Given patterns of sleep, physical activity and body composition, do distinct lifestyle
profiles emerge among children and adolescents, and how do these profiles relate to
problematic internet use and mental health screening scores?

This is an **unsupervised segmentation task**, not a predictive modelling task. See
`reports/challenge_brief.md` for the full assessment brief.

## Folder structure

```
Team6_Lifestyle_Archetypes_PIU/
├── data/
│   ├── raw/                 # Original Kaggle download (train.csv, test.csv, actigraphy files) — not tracked in git
│   └── processed/           # Cleaned / feature-engineered datasets, shared across Python and R
├── python/                  # Python track
│   ├── notebooks/           # Analysis notebooks, run in order (01 -> 04)
│   ├── src/                 # Reusable Python functions (data prep, clustering, plotting helpers)
│   └── requirements.txt
├── r/                       # R track
│   ├── notebooks/           # Analysis R Markdown files, run in order (01 -> 04)
│   ├── R/                   # Reusable R functions
│   └── install.R
├── outputs/
│   ├── figures/             # Exported plots (UMAP, radar charts, heatmaps) from either track
│   └── tables/              # Exported summary tables (cluster stats, validation metrics)
├── reports/
│   ├── challenge_brief.md       # Original assessment brief, for reference
│   ├── written_summary.md       # 2-3 page non-specialist summary (final deliverable)
│   └── technical_note.md        # Methodological choices, parameters, limitations
└── .gitignore
```

## Why two language folders?

The team has a mix of Python and R users. Rather than forcing one language, `python/` and
`r/` are set up as **parallel, independently runnable tracks** that:

- read from and write to the same `data/` and `outputs/` folders, so results are comparable
- follow the same four-notebook structure (data prep → dimensionality reduction & clustering →
  validation & stability → archetype characterisation), so anyone can follow either track
  even without knowing that language
- both feed into the same shared `reports/` deliverables

You don't need to pick one language for the whole team — someone can prototype clustering in
Python while someone else validates in R, as long as everyone reads/writes the shared
`data/processed/` files (prefer `.csv` or `.parquet` for cross-language compatibility).

## Suggested workflow

1. Download the dataset from Kaggle ("Child Mind Institute — Problematic Internet Use") and
   place the raw files in `data/raw/`. This folder is git-ignored — do not commit raw data.
2. Run `01_data_preparation` (Python notebook or R Markdown) to produce a cleaned,
   feature-engineered dataset in `data/processed/`.
3. Run `02_dimensionality_reduction_clustering` to produce UMAP embeddings and candidate
   clustering solutions.
4. Run `03_validation_stability` to compare validation metrics and test stability
   (subsampling / noise sensitivity).
5. Run `04_archetype_characterisation` to describe each archetype and relate it to PIU and
   mental health scores.
6. Export key figures to `outputs/figures/` and summary tables to `outputs/tables/`.
7. Write up findings in `reports/written_summary.md` (non-technical) and
   `reports/technical_note.md` (methodological detail).

## Responsible analysis — read before starting

- Clusters describe **population-level** lifestyle patterns. Never use cluster membership to
  label, diagnose, or make judgements about any individual child.
- Treat clustering results as **hypothesis-generating**. Check stability before reporting a
  pattern as a finding.
- PIU and mental health associations are **preliminary**, derived from train-set labels only —
  report them as such, not as validated clinical findings.
- If a stretch-goal decision tree / rule-based assignment tool is built, label it clearly as an
  **exploratory prototype**, never a screening or triage tool.

See `reports/challenge_brief.md`, section 8, for the full responsible-analysis requirements.
