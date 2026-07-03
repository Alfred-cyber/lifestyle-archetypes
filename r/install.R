# Run this once to install the packages used across the R track notebooks.

packages <- c(
  "tidyverse",   # dplyr, readr, ggplot2, tidyr, purrr
  "umap",        # UMAP dimensionality reduction
  "cluster",     # silhouette scores, clustering utilities
  "clValid",     # Davies-Bouldin, Calinski-Harabasz style validation metrics
  "dbscan",      # DBSCAN clustering
  "fpc",         # additional clustering validation utilities
  "factoextra",  # clustering visualisation helpers
  "car",         # ANOVA utilities
  "fmsb",        # radar charts
  "corrplot",    # correlation heatmaps
  "rmarkdown",
  "knitr"
)

installed <- rownames(installed.packages())
to_install <- setdiff(packages, installed)

if (length(to_install) > 0) {
  install.packages(to_install, repos = "https://cloud.r-project.org")
} else {
  message("All required packages already installed.")
}
