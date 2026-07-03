# Technical Note

*Methodological choices, parameters and limitations. Replace this template with the final
write-up.*

## Data

- Source, sample size, date accessed.
- Missingness handling: what was dropped, imputed, or flagged.
- Feature engineering: list engineered features and how each was derived.

## Dimensionality reduction

- Method: UMAP.
- Parameters used (`n_neighbors`, `min_dist`, `n_components`) and why.
- Alternatives considered (e.g. PCA, t-SNE) and why UMAP was chosen.

## Clustering

- Algorithms compared: K-means, hierarchical clustering, DBSCAN.
- Final choice and parameters (e.g. k, linkage, eps/minPts), with rationale.

## Validation

- Metrics used: silhouette score, Davies–Bouldin index, Calinski–Harabasz index — what each
  showed.
- Stability checks performed (subsampling / noise sensitivity) and results.

## Archetype characterisation

- Statistical tests used (ANOVA, chi-square) and what was tested.
- How PIU and mental health associations were computed, and why they are labelled preliminary.

## Limitations

- Sample and generalisability limitations.
- Screening-instrument vs diagnostic-instrument distinction.
- Any parameter sensitivity observed.

## Reproducibility

- Software/package versions used.
- Random seeds set.
- Order in which notebooks should be run.
