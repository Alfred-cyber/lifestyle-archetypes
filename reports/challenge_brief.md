# Team 6 - Lifestyle Archetypes and Problematic Internet Use

Identifying Lifestyle Archetypes Associated with Problematic Internet Use in Children and
Adolescents. An unsupervised learning exploration of sleep, physical activity and body
composition patterns using the Child Mind Institute's Healthy Brain Network data.

The question at the heart of the challenge: Given patterns of sleep, physical activity and
body composition, do distinct lifestyle profiles emerge among children and adolescents, and
how do these profiles relate to problematic internet use and mental health screening scores?

**Recommendation:** Use the Child Mind Institute — Problematic Internet Use dataset on
Kaggle, drawn from the Healthy Brain Network study. It combines wearable-derived activity and
sleep data, physical measurements, and mental health screening scores on roughly 3,800
children and adolescents, and is well suited to population segmentation rather than
prediction.

| | |
|---|---|
| Challenge type | Unsupervised learning and population segmentation; not a predictive modelling task |
| Primary dataset | Child Mind Institute Healthy Brain Network — Problematic Internet Use (Kaggle) |
| Population | Children and adolescents aged approximately 5–22 in the Healthy Brain Network cohort |
| Core focus | Lifestyle segmentation via clustering, and how segments relate to PIU and mental health scores |
| Core outputs | Validated cluster solution, archetype characterisation, and clear non-technical communication |

## 1. Assessment Objective

The challenge asks interns to segment children and adolescents into distinct lifestyle groups
based on sleep, physical activity and body composition data, and to describe how those groups
differ in problematic internet use (PIU) patterns and mental health outcomes. The emphasis is
on justified methodological choices, honest validation, and communicating population segments
to a non-specialist audience — not on building a predictive or diagnostic model.

## 2. Brief Description of the Challenge

Interns will apply unsupervised learning to answer "who are these children?" and "what
lifestyle patterns matter?" rather than "will this child develop problematic internet use?"
Working from wearable-derived sleep and activity measures, physical measurements and body
composition markers, they will reduce dimensionality, cluster the resulting feature space, and
validate the resulting groups for stability and interpretability before relating them to PIU
and mental health screening scores.

This is deliberately not a prediction task. The dataset was originally released as a Kaggle
competition aimed at predicting a Severity Impairment Index, but this challenge repurposes it
for exploratory segmentation: the goal is a defensible, well-validated description of lifestyle
archetypes, not a classifier.

**Important analytical boundary:** PIU and mental health scores in this dataset are screening
instrument results, not clinical diagnoses. Clusters describe population-level lifestyle
patterns; they must not be used to label, diagnose, or make judgements about any individual
child. Clustering is exploratory, not confirmatory — a pattern that looks clean in one run must
be checked for stability before it is reported as a finding.

## 3. Learning and Assessment Focus

- **Multimodal data preparation:** working with wearable, questionnaire and physical
  measurement data to build an analysis-ready dataset.
- **Justified unsupervised learning:** selecting and defending dimensionality reduction and
  clustering methods, rather than running defaults.
- **Cluster validation:** assessing solution stability, interpretability and relevance rather
  than chasing the best silhouette score.
- **Population characterisation:** using statistical testing and domain knowledge to understand
  what makes each group distinct.
- **Communication:** building visualisations and narratives that explain lifestyle patterns to
  audiences without machine learning training.

## 4. Suggested Analytical Route

1. **Prepare and explore the data.** Load and combine the train and test data; document
   completeness, missingness patterns and measurement ranges; engineer features such as daily
   sleep duration and variability, activity intensity and consistency, and body composition
   markers; produce exploratory plots of each variable and their pairwise correlations.
2. **Reduce dimensionality and cluster.** Standardise features; apply UMAP to reduce the
   lifestyle data to 2D and 3D, exploring how `n_neighbors` and `min_dist` affect cluster
   separation; fit and compare multiple clustering algorithms (K-means, hierarchical
   clustering, DBSCAN), justifying why more than one was tested.
3. **Validate the solution.** Use multiple validation metrics (silhouette score,
   Davies–Bouldin index, Calinski–Harabasz index) and understand what each is actually
   measuring; test stability by re-running clustering on subsamples and on data with added
   feature noise.
4. **Characterise the archetypes (optional but recommended).** Describe each cluster's mean
   sleep, activity, BMI, age and sex distribution; test for significant differences using
   ANOVA or chi-square as appropriate; examine how clusters differ in PIU and mental health
   scores; check whether cluster–PIU associations hold under slightly different clustering
   parameters.
5. **Synthesise and communicate.** Write a concise summary of the archetypes, why they matter,
   and which lifestyle factors appear most modifiable; produce one clear summary visualisation
   (e.g. a radar chart or heatmap) per archetype.

## 5. Dataset

| | |
|---|---|
| Name | Child Mind Institute — Problematic Internet Use |
| Provider | Child Mind Institute, via the Healthy Brain Network study, hosted on Kaggle |
| Access | Free download via Kaggle; requires a Kaggle account to accept competition data terms |
| Sample | Approximately 3,800 children and adolescents aged 5–22 |
| Design | Clinical and research screening sample, combining tabular questionnaire and physical measurement data with accelerometer (actigraphy) time-series data |
| Lifestyle measures | Sleep duration and variability, physical activity intensity and consistency (from wearable accelerometer data), body composition markers |
| Outcome measures | Problematic internet use severity screening (Severity Impairment Index) and mental health screening scores, including depression and anxiety indicators where available |

**Why this dataset is suitable.** The dataset combines objective wearable-derived lifestyle
data with self- or parent-reported screening measures in the same children, which is exactly
what a lifestyle-to-outcome segmentation analysis needs. Its origin as a Kaggle competition
means it is well documented and actively discussed in a public community, giving interns real
published context and worked examples to learn from without treating those examples as the
"correct" answer.

### Suggested variable families

| Area | Examples | Role in the challenge |
|---|---|---|
| Sleep | Duration, variability, timing (from accelerometer data) | Core lifestyle segmentation feature |
| Physical activity | Intensity, consistency, active minutes (from accelerometer data) | Core lifestyle segmentation feature |
| Body composition | BMI and related physical measurements | Core lifestyle segmentation feature |
| Internet use outcome | Severity Impairment Index and related PIU screening items | Primary outcome for characterising clusters, not for prediction |
| Mental health | Depression and anxiety screening scores, where available | Secondary outcome for cluster characterisation |
| Demographics | Age, sex | Used in characterisation and stratified validation, not as clustering inputs |

**Official access links**
- Child Mind Institute — Problematic Internet Use (Kaggle competition page) — dataset
  download, data dictionary and competition rules.
- Screen Time Struggles — Child Mind Institute project summary — background on the study's
  purpose and its limitations as understood by the data's originators.

## 6. What Interns Should Submit

The submission should show a reproducible, honestly validated path from raw multimodal data to
a small number of well-characterised lifestyle archetypes. Python or R may be used.

| Deliverable | Expected content |
|---|---|
| Data preparation notebook | Import, combination of train and test data, missingness documentation, feature engineering decisions and validation checks. |
| Clustering comparison | Multiple clustering solutions compared, with documented decision rationale, validation metrics and a stability analysis. |
| Archetype characterisation | A table of 3–5 lifestyle archetypes with summary statistics and statistical tests, and their relationship to PIU and mental health scores. |
| Visual evidence | UMAP and cluster visualisations, plus one summary visualisation (e.g. radar chart or heatmap) per archetype. |
| Written summary | A 2–3 page summary of findings for a non-specialist audience, plus a short technical note documenting methodological choices, parameters and limitations. |

## 7. Expected Outcome

A successful submission will provide a well-validated, interpretable set of lifestyle
archetypes derived from sleep, activity and body composition data, with a clear and
appropriately cautious account of how those archetypes relate to problematic internet use and
mental health screening scores. It will demonstrate that the clusters are stable rather than
an artefact of one parameter choice, and will communicate the findings in language accessible
to a non-technical audience.

**Minimum success criteria**
- Documents data completeness, missingness and feature engineering decisions explicitly.
- Justifies the choice of dimensionality reduction and clustering methods rather than using
  defaults without explanation.
- Compares at least two clustering approaches and reports multiple validation metrics.
- Includes a stability check (e.g. subsampling or noise sensitivity) and reports whether the
  solution held up.
- Characterises 3–5 archetypes with summary statistics and appropriate statistical tests.
- Relates archetypes to PIU and mental health scores as associations only, using train-set
  labels and explicitly noting this is a preliminary, subset-derived finding.
- Produces a reproducible submission with a non-technical written summary and clear
  visualisations.

**Optional stretch work**
- Test whether cluster–PIU associations hold when re-clustering with different parameters, as
  a robustness check.
- Prototype a simple decision tree or rule-based tool that assigns new children to archetypes
  based on lifestyle features, clearly labelled as an exploratory prototype rather than a
  screening or triage tool.
- Draft one recommendation for a future intervention study based on the identified lifestyle
  patterns.

## 8. Responsible Analysis Requirements

| Requirement | What good practice looks like |
|---|---|
| No individual diagnosis or labelling | Clusters describe population-level lifestyle patterns. Do not use cluster membership to label, diagnose, or make judgements about any individual child. |
| Exploratory, not confirmatory | Treat clustering results as hypothesis-generating. Any pattern must be checked for stability before being reported as a finding. |
| Preliminary outcome associations | PIU and mental health associations are derived from a subset of the data using train-set labels; report them explicitly as preliminary, not as validated clinical findings. |
| Careful stretch-goal framing | If a decision tree or rule-based assignment tool is built, present it as an exploratory prototype only — never as a screening, diagnostic or triage tool for real children. |
| Respectful language | Describe archetypes in terms of modifiable lifestyle patterns, not as fixed traits or risk labels attached to children. |
| Method transparency | Document every parameter choice (e.g. UMAP settings, number of clusters, algorithm) so another analyst can see exactly how the solution was reached. |

## 9. What Good Work Will Demonstrate

- **Methodological judgement:** dimensionality reduction and clustering choices are justified,
  not just run with defaults.
- **Validation rigour:** solution stability and interpretability are genuinely tested, not
  assumed from a single metric.
- **Statistical literacy:** appropriate tests are used to characterise cluster differences,
  with attention to what each metric actually shows.
- **Analytical honesty:** exploratory findings are reported as exploratory, with preliminary
  associations clearly flagged as such.
- **Communication:** technical segmentation work is translated into a narrative and visuals a
  non-specialist audience can follow.
- **Reproducibility:** another analyst can understand, rerun and verify the workflow and its
  parameter choices.
