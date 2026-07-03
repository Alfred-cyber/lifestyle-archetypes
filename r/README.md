# R track

## Setup

Open `install.R` in RStudio (or run `Rscript install.R` from a terminal) to install required
packages.

## Notebooks (R Markdown, run in order)

1. `01_data_preparation.Rmd` — load and combine `data/raw/train.csv` and `test.csv`, document
   missingness, engineer sleep/activity/body-composition features, write
   `data/processed/lifestyle_features.csv`.
2. `02_dimensionality_reduction_clustering.Rmd` — standardise features, run UMAP (2D/3D), fit
   and compare K-means, hierarchical clustering and DBSCAN.
3. `03_validation_stability.Rmd` — silhouette / Davies–Bouldin / Calinski–Harabasz scores,
   subsampling and noise-sensitivity stability checks.
4. `04_archetype_characterisation.Rmd` — per-cluster summary stats, ANOVA/chi-square tests,
   relationship to PIU and mental health scores, radar chart / heatmap per archetype.

## R/

Put reusable functions here (e.g. `data_prep.R`, `clustering.R`, `plotting.R`) and source them
into R Markdown files with:

```r
source("../R/data_prep.R")
```

This keeps notebooks readable and makes the same helper functions testable and reusable.

## Working across languages

Read from and write to the shared `data/processed/` folder using `.csv` (via `readr::read_csv`
/ `write_csv`) so files stay compatible with the Python track. Avoid `.rds` for anything the
Python side needs to read.
