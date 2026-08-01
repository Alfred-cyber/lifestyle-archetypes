# Technical Note

*Lifestyle archetypes and problematic internet use (PIU) — methodological choices, parameters
and limitations, based on the initial findings.*

## Data

- **Source:** Child Mind Institute Healthy Brain Network dataset, via the Kaggle competition
  *"child-mind-institute-problematic-internet-use"* (Alexander et al., 2017).
- **Sample size:** 3,960 children/adolescents in `train.csv`. Of these, 996 had an actigraphy
  (wrist-worn accelerometer) recording, and after excluding recordings with insufficient valid
  wear time, **733 children (≈18.5% of the full sample)** had usable actigraphy data and form
  the final modelling sample.
- **Missingness handling:**
  - Questionnaire-instrument missingness (FGC, BIA, PAQ_A/PAQ_C) is largely structural — these
    are age-gated instruments or single-station non-completions — and was documented rather than
    silently dropped.
  - Actigraphy is missing for participants who did not wear the device; these participants are
    **excluded from the clustering sample entirely** rather than imputed, since sleep/activity
    features cannot be meaningfully fabricated for them.
  - Residual, sporadic missingness in body-composition/questionnaire features (after the
    actigraphy filter) was **median-imputed** (chosen over mean imputation because several
    body-composition variables are right-skewed).
  - Outcome variables (PCIAT, CGAS, SDS, screen-time) were **never imputed** — they are held out
    and only used at the characterisation stage.
- **Feature engineering (10 lifestyle features per child):**
  - From actigraphy (5-second epochs; non-wear epochs excluded; only days with ≥16 hours valid
    wear retained): `sleep_duration_mean`, `sleep_duration_std`, `activity_intensity_mean`,
    `activity_intensity_std`, `weekday_weekend_activity_ratio`. "Night" = 22:00–08:00 clock hours;
    "asleep" = ENMO < 0.02 g during the night window — a simplified, movement-based proxy, not a
    clinical sleep-staging algorithm (cf. van Hees et al., 2015).
  - `BMI` (direct physical-exam value, falling back to BIA-derived BMI where missing).
  - `BIA-BIA_Fat`, `BIA-BIA_FFMI`, `BIA-BIA_SMM` (body composition, used directly).
  - `PAQ_Total` (self/parent-reported activity, harmonised from the age-gated `PAQ_A`/`PAQ_C`
    instruments).
  - Age, sex, and all PIU/mental-health scores were **deliberately excluded** from the clustering
    inputs and held back for post-hoc characterisation only, so the grouping could not be
    influenced by the outcome it would later be compared against.

## Dimensionality reduction

- **Method:** UMAP (McInnes, Healy, Saul, & Großberger, 2018), applied to the 10 standardised
  (z-scored) lifestyle features.
- **Parameters used:**
  - Main pipeline: `n_neighbors=15`, `min_dist=0.1`, `n_components=2` (for visualisation) and
    `n_components=5` (for clustering). `n_neighbors=15` was chosen to balance local detail
    against the global structure needed for population-level archetypes; `min_dist=0.1` keeps
    groups visually separable without artificially collapsing continuous variation.
  - Independent three-group robustness check (see *Clustering*, below): `n_neighbors=30`,
    `min_dist=0.1`, `n_components=5`, a different random seed — a deliberately more "global"
    parameterisation, used to test whether findings survive a materially different embedding.
- **Alternatives considered:** PCA was run only as a quick sanity check on cumulative explained
  variance, not as the primary reduction method. t-SNE was not used. UMAP was preferred because it
  better preserves both local and global structure at a computational cost manageable for this
  sample size.

## Clustering

- **Algorithms compared:** K-means (spherical, evenly-sized clusters), Agglomerative/hierarchical
  clustering with Ward linkage (nested, variable-shape clusters), and DBSCAN (density-based,
  can flag outliers as noise instead of forcing every child into a cluster).
- **Final choice (main pipeline):** K-means, with **k selected by silhouette score across k=2–8**.
  The silhouette-optimal solution was **k=2**, with a silhouette score of **≈0.79** — close to the
  best possible and clearly the strongest of the three algorithms on internal validation.
- **Important caveat on this choice:** although k=2 was the cleanest and most stable result (see
  *Validation*), post-hoc inspection showed the split was driven almost entirely by one feature —
  `sleep_duration_mean` — with one group averaging a plausible ~7.9 hours/night and the other
  averaging under 2 hours/night, an implausible value for a healthy child. This indicates the
  split most likely reflects a **failure of the actigraphy-based sleep estimate for a subset of
  children** (e.g. device removal, or sleep timing that doesn't fit the fixed 22:00–08:00 window),
  rather than a genuine lifestyle contrast. No other lifestyle feature (BMI, body fat, muscle
  mass, self-reported activity) differed meaningfully between the two groups.
- **Follow-up (independent, exploratory):** a second run **forcing k=3** (not silhouette-selected)
  under the alternative UMAP parameterisation above, used only as a robustness/alternative check,
  not as a replacement for the main k=2 solution.

## Validation

- **Metrics used:**
  - **Silhouette score:** K-means (k=2) scored ≈0.79, the strongest of the three algorithms;
    reported alongside Davies–Bouldin (lower better) and Calinski–Harabasz (higher better, but
    sensitive to cluster count) for a fuller picture, since silhouette alone is sensitive to a
    single dominant feature.
  - **Davies–Bouldin / Calinski–Harabasz:** computed for all three algorithms' chosen solutions
    on the same footing, with DBSCAN's noise points (-1) excluded from its own metric calculation.
- **Stability checks:**
  - **Subsampling (80% resamples, 10 trials):** ARI close to 1.0 — near-perfect agreement across
    resamples.
  - **Noise sensitivity (Gaussian noise, σ=0.1 in standardised units, 10 trials):** ARI close to
    1.0 — the solution barely moved under small perturbation.
  - **Interpretation caveat:** this near-perfect stability is a property of the split being driven
    by one dominant, easily-separable feature (implausible vs. plausible sleep estimates) — it
    demonstrates the split is *statistically* robust, not that it is *substantively* meaningful.
    Stability and validity are not the same thing, and this result is the clearest illustration
    of why both need to be checked.

## Archetype characterisation

- **Statistical tests used:** one-way ANOVA and Kruskal-Wallis (robust to non-normal
  distributions) for continuous lifestyle features and outcome scores across archetypes;
  chi-square for the categorical sex distribution across archetypes.
- **Result for the main k=2 solution:** of the 10 lifestyle features, only `sleep_duration_mean`
  differed significantly between groups; all others (BMI, body fat, FFMI, muscle mass,
  self-reported activity, activity intensity/variability, weekday–weekend ratio) showed **no
  significant difference (p > 0.05)** — consistent with the "measurement artifact, not lifestyle
  type" interpretation above.
- **PIU / mental-health associations:** PCIAT total score, the `sii` severity category, the
  sleep-disturbance (SDS) score, and self-reported screen time were all **statistically similar**
  between the two main groups. Only the clinician-rated CGAS score differed, and since no other
  outcome measure agreed with it, this single result is **not treated as strong evidence** on its
  own. **The main, most trustworthy result of this analysis is therefore a null result:** the
  cleanest, most stable lifestyle split found did not correspond to a real difference in
  problematic internet use.
- **Why these associations are labelled preliminary:** PCIAT/CGAS/SDS are **screening instrument
  results, not clinical diagnoses**; all associations are computed on train-set labels for the
  actigraphy-usable subset only, are not causal, and are reported as hypothesis-generating, not
  as validated clinical findings, regardless of which clustering solution produced them.
- **Independent three-group follow-up:** under the separate, more exploratory k=3 run, mean PCIAT
  scores rose in clear, statistically significant steps across the three groups (approximately 24,
  27, and 33 points). This is a **promising lead from a single alternative run**, not a confirmed
  finding — it has not yet been through the same stability analysis (subsampling / noise
  sensitivity) applied to the main k=2 solution, and needs independent confirmation (e.g. on a
  held-out sample or separate cohort) before being treated as established.

## Limitations

- **Sample and generalisability:** only 733 of 3,960 children (≈18.5%) had usable actigraphy data.
  Device-wear is unlikely to be random with respect to the lifestyle factors under study, so
  findings may not generalise to the full population.
- **Screening vs. diagnostic instruments:** PCIAT, CGAS, and SDS are screening tools completed by
  parents/clinicians, not diagnostic assessments. All reported associations describe group-level
  patterns and must never be used to label, diagnose, or judge any individual child.
- **Measurement validity, not just clustering validity:** the main finding of this project is that
  the most statistically robust clustering result (k=2, near-perfect stability) turned out to
  reflect a **sleep-estimation measurement failure** for a subset of children, not a genuine
  lifestyle archetype. This is a central limitation of the fixed-window, movement-based sleep
  proxy used here, not of the clustering method itself.
- **Parameter sensitivity observed:** changing k (2 vs. a forced 3) under a different UMAP
  neighbourhood/seed produced a **substantively different and more promising result** (a graded
  PCIAT relationship) than the primary silhouette-selected solution. This is a clear demonstration
  that conclusions here are sensitive to clustering parameterisation, and is the reason the
  three-group result is flagged as exploratory rather than confirmatory.

## Reproducibility

- **Software/package versions used:** `pandas`, `numpy`, `matplotlib`, `seaborn`, `scipy`,
  `scikit-learn`, `scikit-learn-extra`, `umap-learn`, `pyarrow`, `missingno` (versions as pinned
  in each notebook's install cell / environment; record exact versions at time of the final run).
- **Random seeds:**
  - Main pipeline: `random_state=42` throughout (UMAP embeddings, K-means, subsampling draws);
    noise-sensitivity trials use `random_state=100+trial` (trials 0–9) to vary the injected noise
    independently of the resampling seed.
  - Independent three-group check: `random_state=7` throughout, chosen specifically to differ from
    the main pipeline's seed so the check is not merely a re-run with the same randomness.
- **Order in which notebooks should be run:**
  1. `01_data_preparation.ipynb` — raw data → clean, imputed modelling table.
  2. `02_dimensionality_reduction_clustering.ipynb` — UMAP embeddings + three clustering methods.
  3. `03_validation_stability.ipynb` — validation metrics, stability checks, selects the final
     method (K-means, k=2, per the findings above).
  4. `04_archetype_characterisation.ipynb` — profiling, PIU/mental-health associations, visual
     summary, written limitations.
  5. `05_three_group_alternative_analysis.ipynb` — **independent, exploratory** check (forced k=3,
     different seed/parameterisation); can be run any time after notebook 01, and optionally after
     notebook 04 for a direct cross-check against the main archetypes. Results here require
     independent confirmation before being treated as established.

---

### References

Alexander, L. M., Escalera, J., Ai, L., et al. (2017). An open resource for transdiagnostic
research in pediatric mental health and learning disorders. *Scientific Data*, 4, 170181.

McInnes, L., Healy, J., Saul, N., & Großberger, L. (2018). UMAP: Uniform Manifold Approximation
and Projection. *Journal of Open Source Software*, 3(29), 861.

van Hees, V. T., Sabia, S., Anderson, K. N., et al. (2015). A novel, open access method to assess
sleep duration using a wrist-worn accelerometer. *PLOS ONE*, 10(11), e0142533.

Young, K. S. (1998). Internet addiction: The emergence of a new clinical disorder.
*CyberPsychology and Behavior*, 1(3), 237–244.