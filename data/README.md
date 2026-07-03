# Data folder

## raw/
Place the untouched Kaggle download here:
- `train.csv`, `test.csv` (tabular questionnaire + physical measurement data)
- `series_train.parquet/`, `series_test.parquet/` (actigraphy time-series data, if used)
- `data_dictionary.csv`

This folder is git-ignored. Do not commit raw data or push it anywhere outside the team.

## processed/
Cleaned, feature-engineered datasets that both the Python and R tracks read from and write to.
Prefer `.csv` or `.parquet` (not `.pkl` or `.rds`) so files are readable from either language.

Suggested files:
- `lifestyle_features.csv` — one row per participant: engineered sleep, activity and body
  composition features, output of notebook `01_data_preparation`
- `cluster_assignments.csv` — participant ID + cluster label from the chosen solution, output
  of notebook `02_dimensionality_reduction_clustering`
- `archetype_summary.csv` — per-cluster summary statistics, output of notebook
  `04_archetype_characterisation`

Keep a short note at the top of each notebook recording which processed file it reads and
writes, so the Python and R tracks stay in sync.
