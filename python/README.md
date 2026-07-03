# Python track

## Setup

```bash
python -m venv venv
source venv/bin/activate   # Windows: venv\Scripts\activate
pip install -r requirements.txt
```

## Notebooks (run in order)

1. `01_data_preparation.ipynb` — load and combine `data/raw/train.csv` and `test.csv`,
   document missingness, engineer sleep/activity/body-composition features, write
   `data/processed/lifestyle_features.csv`.
2. `02_dimensionality_reduction_clustering.ipynb` — standardise features, run UMAP (2D/3D),
   fit and compare K-means, hierarchical clustering and DBSCAN.
3. `03_validation_stability.ipynb` — silhouette / Davies–Bouldin / Calinski–Harabasz scores,
   subsampling and noise-sensitivity stability checks.
4. `04_archetype_characterisation.ipynb` — per-cluster summary stats, ANOVA/chi-square tests,
   relationship to PIU and mental health scores, radar chart / heatmap per archetype.

## src/

Put reusable functions here (e.g. `data_prep.py`, `clustering.py`, `plotting.py`) and import
them into notebooks with:

```python
import sys
sys.path.append("../src")
from data_prep import engineer_features
```

This keeps notebooks readable and makes the same helper functions testable and reusable.
