# Do Sleep and Activity "Types" in Kids Relate to Problematic Internet Use? A Simple Research Report

### Abstract

Problematic Internet Use (PIU) has become an increasing public health concern among children and adolescents due to its reported associations with poor sleep, reduced physical activity, obesity, depression and impaired psychosocial functioning (Kuss & Lopez-Fernandez, 2016; Odgers & Jensen, 2020). Although these lifestyle factors have traditionally been studied individually, less is known about whether they naturally combine into distinct behavioural patterns that are associated with PIU. This study aimed to identify lifestyle archetypes using objectively measured sleep, physical activity and body composition, and to determine whether these archetypes differed in problematic internet use or mental health outcomes.

Data were obtained from the Child Mind Institute Healthy Brain Network (Alexander et al., 2017). Although the original dataset contained 3,960 participants, only 996 had wearable actigraphy recordings and 733 participants had data of sufficient quality for analysis. Ten lifestyle variables derived from wearable accelerometry, body composition measurements and self-reported physical activity were used to characterise each participant. Uniform Manifold Approximation and Projection (UMAP) was first applied to reduce data complexity before comparing three unsupervised clustering algorithms: K-means, Agglomerative clustering and DBSCAN. Cluster quality was assessed using the Silhouette Coefficient, Davies–Bouldin Index and Calinski–Harabasz Index, while clustering robustness was evaluated using repeated subsampling and noise perturbation with the Adjusted Rand Index (ARI). Measures of Problematic Internet Use, depression symptoms, clinician-rated functioning and self-reported internet use were compared only after cluster formation to avoid circular analysis.

The optimal solution was a two-cluster K-means model that demonstrated excellent internal validity (Silhouette Coefficient = 0.792; Davies–Bouldin Index = 0.257; Calinski–Harabasz Index = 4862.64) and exceptional stability (subsampling ARI = 1.000 ± 0.000; noise perturbation ARI = 0.993 ± 0.006). However, inspection of the clusters showed that separation was driven primarily by implausibly short estimated sleep duration within one cluster, suggesting a measurement artefact rather than a meaningful lifestyle subtype. Consequently, no statistically significant differences were observed between the validated clusters for Problematic Internet Use (PCIAT), depression symptom scores, severity indices or reported internet use, although clinician-rated global functioning (CGAS) differed significantly. An exploratory three-cluster analysis demonstrated progressively increasing PCIAT scores across clusters, suggesting that more complex behavioural subgroups may exist.

Overall, the primary analysis did not identify robust lifestyle archetypes associated with Problematic Internet Use. Instead, the findings highlight the importance of rigorous validation when applying unsupervised machine learning to wearable health data and demonstrate that statistically robust clusters should always be interpreted alongside their biological and clinical plausibility.

---

## 1. Introduction

Digital technology has become an integral part of childhood and adolescence. Young people now use the internet for education, entertainment, communication and social interaction daily. While internet use provides many developmental and educational benefits, excessive or poorly controlled use has increasingly been associated with negative physical, psychological and social outcomes (Odgers & Jensen, 2020). Researchers commonly refer to this behaviour as Problematic Internet Use (PIU), describing a pattern of internet use that begins to interfere with daily functioning, academic performance, sleep, relationships or emotional wellbeing (Young, 1998).

Recent systematic reviews have demonstrated consistent associations between PIU and poorer sleep quality, shorter sleep duration, reduced physical activity, obesity, anxiety and depression (Kuss & Lopez-Fernandez, 2016). Sleep is particularly important during childhood because it supports cognitive development, emotional regulation, memory consolidation and physical growth (Buysse, 2014). Likewise, regular physical activity contributes to cardiovascular health, psychological wellbeing and healthy weight maintenance throughout childhood and adolescence (Sallis et al., 2016). These observations have led researchers to hypothesise that combinations of sleep, physical activity and body composition may form identifiable lifestyle patterns that influence children's vulnerability to problematic internet use.

Most previous studies have examined these lifestyle factors individually using regression models or correlation analyses. While these variable-centred approaches identify associations between individual risk factors and outcomes, they may fail to capture naturally occurring combinations of behaviours within individuals. In reality, children rarely experience poor sleep, inactivity or obesity in isolation. Instead, these behaviours frequently coexist and interact in complex ways. A person-centred analytical approach therefore offers the opportunity to identify distinct lifestyle archetypes that better represent real-world behavioural patterns.

Unsupervised machine learning provides an effective framework for exploring these multidimensional relationships. Unlike supervised learning, which predicts predefined outcomes, unsupervised learning identifies naturally occurring structures within data without prior knowledge of the outcome variables (James et al., 2021). Clustering algorithms group participants according to similarities in their measured characteristics, allowing behavioural patterns to emerge directly from the data rather than from predefined assumptions. Outcome variables such as Problematic Internet Use can then be compared across the identified groups, reducing the risk of circular analysis.

The present study used data from the Child Mind Institute Healthy Brain Network (HBN), one of the largest openly available paediatric mental health datasets, containing extensive behavioural, physical health and wearable actigraphy data from children and adolescents (Alexander et al., 2017). Wearable accelerometers provide an objective measure of habitual sleep and physical activity over multiple consecutive days, complementing traditional self-report measures that are susceptible to recall bias (van Hees et al., 2015). By combining objective wearable measurements with body composition and physical activity variables, this dataset provides an opportunity to investigate whether meaningful lifestyle archetypes can be identified.

The aim of this study was therefore to determine whether objectively measured sleep, physical activity and body composition form distinct lifestyle archetypes in children and adolescents, and whether these archetypes are associated with Problematic Internet Use or related mental health outcomes. To achieve this, we applied Uniform Manifold Approximation and Projection (UMAP) for dimensionality reduction, compared multiple unsupervised clustering algorithms, rigorously evaluated cluster quality and stability, and subsequently compared validated clusters using established measures of Problematic Internet Use, clinician-rated functioning and mental health.

## 2. Key Terms, Explained Simply

- **Actigraphy**: using a small wearable device (like a smartwatch) to record body movement over several days, used here to estimate sleep and activity.
- **PCIAT (Parent-Child Internet Addiction Test)**: a 20-question survey filled out by a parent, scoring how much internet use is affecting a child's life (Young, 1998).
- **CGAS (Children's Global Assessment Scale)**: a 1–100 score a clinician gives after talking with a family, rating how well a child is functioning overall in daily life (Shaffer et al., 1983).
- **BMI, body fat, muscle mass**: standard measurements of body size and composition.
- **Clustering**: a computer method for automatically sorting things (here, children) into groups based on how similar their numbers are to each other, without being told the groups in advance.
- **UMAP**: a technique that takes many numbers describing something (here, 10 numbers per child) and compresses them down to a simpler shape that is easier for a computer — and a human — to study, while trying to keep genuinely similar things close together (McInnes, Healy, Saul, & Großberger, 2018).
- **Silhouette score**: a number between -1 and 1 that says how neatly separated a set of groups are. Higher is better.
- **p-value**: a number from a statistical test that helps judge whether a pattern is likely to be real or could easily have happened by chance. Smaller p-values (usually below 0.05) suggest the pattern is probably real.
- **ARI (Adjusted Rand Index)**: a score from 0 to 1 showing how much two groupings of the same children agree with each other. We used it to check whether our groups stayed the same when we shook the data up a little.

- For readers unfamiliar with machine learning or paediatric mental health research, the following terms are used throughout this report.

- Actigraphy refers to the use of a wrist-worn accelerometer to continuously measure movement over several days. Movement patterns are subsequently analysed to estimate sleep duration, sleep timing and physical activity levels (van Hees et al., 2015).

- Problematic Internet Use (PIU) describes excessive or poorly controlled internet use that interferes with everyday functioning, social relationships, education or psychological wellbeing (Young, 1998).

- PCIAT (Parent–Child Internet Addiction Test) is a validated parent-completed questionnaire used to quantify the severity of children's problematic internet use (Young, 1998).

- CGAS (Children's Global Assessment Scale) is a clinician-rated measure of overall psychological, social, and academic functioning, scored from 1 to 100, with higher scores indicating better functioning (Shaffer et al., 1983).

- Body composition refers to measurements including Body Mass Index (BMI), body fat percentage and muscle mass, which collectively describe physical health beyond body weight alone.

- Clustering is an unsupervised machine learning technique that automatically groups individuals according to similarities in their measured characteristics without requiring predefined outcome labels.

- Uniform Manifold Approximation and Projection (UMAP) is a dimensionality reduction algorithm that compresses high-dimensional data into a smaller number of dimensions while preserving local relationships between observations, making complex datasets easier to visualise and cluster (McInnes et al., 2018).

- Silhouette Coefficient is an internal validation metric ranging from −1 to 1 that quantifies how well separated clusters are, with higher values indicating better-defined clusters (Rousseeuw, 1987).

- Davies–Bouldin Index measures within-cluster similarity relative to between-cluster separation, with lower values indicating superior clustering performance (Davies & Bouldin, 1979).

- Calinski–Harabasz Index evaluates clustering quality by comparing between-cluster dispersion with within-cluster dispersion, where higher values indicate better-defined clusters (Calinski & Harabasz, 1974).

- Adjusted Rand Index (ARI) measures agreement between different clustering solutions. Values approaching 1 indicate highly stable clustering results that remain consistent despite changes to the input data (Hubert & Arabie, 1985).

## 3. Data and Methods

# 3.1 Study Design

This study employed an exploratory, cross-sectional design using unsupervised machine learning to investigate whether children and adolescents could be grouped into naturally occurring lifestyle archetypes based on objectively measured sleep, physical activity, and body composition. Unlike supervised learning approaches, which predict predefined outcomes, unsupervised learning identifies patterns directly from the data without prior knowledge of outcome variables (James et al., 2021). This approach was selected because the primary objective was to discover whether meaningful lifestyle subgroups existed before investigating whether these groups differed in Problematic Internet Use (PIU) or mental health outcomes.

Importantly, outcome variables including Problematic Internet Use, depression symptoms, clinician-rated functioning and reported internet use were deliberately excluded during cluster formation. These variables were examined only after clustering had been completed to minimise circular analysis and reduce the risk of introducing bias into the clustering process.

# 3.2 Data Source

Data were obtained from the Child Mind Institute Healthy Brain Network (HBN), an ongoing open-access research initiative designed to improve understanding of child and adolescent mental health and neurodevelopment (Alexander et al., 2017). The HBN dataset contains behavioural, cognitive, psychiatric, neuroimaging and physical health data collected from children and adolescents aged between 5 and 21 years across the New York metropolitan area.

The original dataset contained information from 3,960 participants. Of these, 996 participants had wearable actigraphy recordings. Following quality-control procedures, recordings that were incomplete or did not meet minimum data-quality requirements were excluded, resulting in a final analytical sample of 733 participants.

Although this reduction substantially decreased the sample size, restricting the analysis to participants with sufficiently complete wearable recordings increased confidence that the lifestyle variables reflected genuine behavioural patterns rather than missing or unreliable measurements.

# 3.3 Lifestyle Feature Engineering

The wearable actigraphy devices continuously recorded wrist movement over several consecutive days. Raw accelerometer data are extremely high-dimensional, making direct analysis impractical. Consequently, each participant's recordings were summarised into a set of interpretable lifestyle features representing habitual sleep and physical activity.

Sleep duration was estimated using periods of minimal movement occurring within a predefined overnight window (22:00–08:00). This simplified movement-based approach is conceptually similar to previously described open-source accelerometer methods (van Hees et al., 2015), although it should be recognised that it provides an estimate of sleep rather than a direct physiological measurement comparable to polysomnography.

Five behavioural features were extracted from the actigraphy recordings:

- Mean nightly sleep duration
- Night-to-night variability in sleep duration
- Mean daytime physical activity
- Day-to-day variability in physical activity
- Difference between weekday and weekend activity levels

These behavioural variables were combined with measurements describing body composition and physical activity:

- Body Mass Index (BMI)
- Body fat percentage
- Muscle mass
- Self-reported physical activity score

Together, these variables formed a multidimensional "lifestyle profile" for each participant. Age, sex, internet-use measures and mental health outcomes were intentionally excluded from this stage so that the clustering algorithms would identify behavioural patterns independently of the study outcomes.

# 3.4 Data Pre-processing

Before clustering, all continuous variables were standardised to ensure that measurements recorded on different numerical scales contributed equally to the clustering process. Standardisation is an important preprocessing step because clustering algorithms such as K-means rely on distance calculations, which can otherwise become dominated by variables with larger numerical ranges (James et al., 2021).

Participants with incomplete lifestyle variables or poor-quality actigraphy recordings were excluded before analysis. This ensured that clustering reflected genuine similarities between participants rather than artefacts introduced by missing data.

# 3.5 Dimensionality Reduction

The lifestyle dataset contained ten correlated variables describing each participant. To improve computational efficiency and facilitate visualisation, Uniform Manifold Approximation and Projection (UMAP) was applied before clustering (McInnes et al., 2018).

UMAP is a nonlinear dimensionality reduction technique that preserves local neighbourhood relationships while representing complex high-dimensional datasets within a lower-dimensional space. Compared with traditional methods such as Principal Component Analysis (PCA), UMAP is better suited for capturing nonlinear relationships commonly observed in behavioural and biomedical datasets.

The reduced representation generated by UMAP was subsequently used as input for the clustering algorithms.

# 3.6 Clustering Algorithms

Three commonly used unsupervised clustering algorithms were evaluated to determine which most effectively identified potential lifestyle archetypes.

K-means Clustering

K-means clustering partitions observations into a predefined number of clusters by minimising the distance between observations and their respective cluster centroids (MacQueen, 1967). It performs particularly well when clusters are relatively compact and approximately spherical.

Agglomerative Hierarchical Clustering

Agglomerative clustering begins by treating each participant as an individual cluster before repeatedly merging the two most similar clusters until the desired number of groups is reached. This produces a hierarchical representation of the data and can identify nested relationships between observations.

DBSCAN

Density-Based Spatial Clustering of Applications with Noise (DBSCAN) identifies clusters by locating regions of high point density while classifying isolated observations as noise (Ester et al., 1996). Unlike K-means, DBSCAN does not require the number of clusters to be specified in advance and is capable of identifying irregularly shaped clusters.

Evaluating multiple algorithms reduced dependence on any single clustering technique and increased confidence that the selected solution represented genuine structure within the dataset.

# 3.7 Cluster Validation

Selecting an appropriate clustering solution requires assessment of both internal quality and stability. Several complementary validation metrics were therefore employed.

The Silhouette Coefficient quantified how well separated clusters were from one another, with values approaching one indicating stronger separation (Rousseeuw, 1987).

The Davies–Bouldin Index measured the similarity between clusters relative to their separation, with lower values indicating better-defined clustering (Davies & Bouldin, 1979).

The Calinski–Harabasz Index compared between-cluster variation with within-cluster variation, where larger values indicate greater cluster distinctiveness (Calinski & Harabasz, 1974).

Cluster stability was further evaluated using two complementary approaches.

First, repeated random subsampling retained approximately 80% of participants before repeating the clustering procedure. Secondly, small amounts of random noise were added to the standardised variables before reclustering. Agreement between the original and repeated clustering solutions was quantified using the Adjusted Rand Index (ARI) (Hubert & Arabie, 1985). Values approaching one indicate highly reproducible clustering results that remain stable despite modest changes to the input data.

# 3.8 Statistical Analysis

Following identification of the optimal clustering solution, demographic, behavioural and clinical variables were compared between clusters.

Primary outcome measures included:

- Parent–Child Internet Addiction Test (PCIAT)
- Children's Global Assessment Scale (CGAS)
- Depression symptom score
- Severity impairment index
- Self-reported internet and computer use

Continuous variables were compared using appropriate statistical tests, while categorical variables were analysed using chi-square procedures where appropriate. Statistical significance was defined using a two-sided significance threshold of p < 0.05.

Importantly, these analyses were performed only after cluster formation had been completed, ensuring that outcome measures played no role in determining the lifestyle archetypes themselves.

# 3.9 Ethical Considerations

This study analysed de-identified secondary data obtained from the publicly available Healthy Brain Network dataset. Ethical approval for participant recruitment, data collection and anonymisation was obtained by the Child Mind Institute as part of the original Healthy Brain Network project (Alexander et al., 2017). The present study involved secondary analysis of anonymised data and therefore posed no additional risk to participants.



## 4. Results

# 4.1 Participant Characteristics

The original Healthy Brain Network dataset contained information from 3,960 children and adolescents. Of these, 996 participants had wearable actigraphy recordings available for analysis. Following quality-control procedures, recordings that were incomplete or failed to meet predefined quality criteria were excluded, resulting in a final analytical sample of 733 participants.

Each participant was represented using ten lifestyle variables derived from wearable actigraphy, body composition measurements and self-reported physical activity. These variables formed the basis for all subsequent clustering analyses.

# 4.2 Comparison of Clustering Algorithms

Three unsupervised clustering algorithms were evaluated to determine which most effectively identified potential lifestyle archetypes:

- K-means clustering
- Agglomerative (hierarchical) clustering
- DBSCAN

Each algorithm was assessed using multiple internal validation metrics alongside measures of clustering stability. Among the three approaches, K-means consistently produced the strongest overall performance and was therefore selected as the primary clustering solution.

The optimal K-means model identified two distinct clusters, comprising 563 participants in Cluster 0 and 170 participants in Cluster 1.

# 4.3 Cluster Validation

Internal validation demonstrated that the two-cluster K-means solution achieved excellent statistical performance.

The Silhouette Coefficient was 0.792, indicating strong separation between clusters and minimal overlap between participants assigned to different groups. The Davies–Bouldin Index was 0.257, demonstrating low within-cluster dispersion relative to the distance separating the clusters. The Calinski–Harabasz Index reached 4862.64, further indicating well-defined cluster structure.

To determine whether the clustering solution was reproducible rather than dependent upon random variation within the dataset, two complementary stability analyses were performed.

Repeated subsampling of approximately 80% of participants produced virtually identical clustering solutions, with a mean Adjusted Rand Index (ARI) of 1.000 ± 0.000. Similarly, adding small amounts of random noise to the standardised variables resulted in a mean ARI of 0.993 ± 0.006, demonstrating exceptional robustness of the clustering solution.

Taken together, these findings indicate that the selected K-means model was both internally valid and highly reproducible.

# 4.4 Cluster Characteristics

Although statistical validation suggested that the clustering solution was robust, examination of the cluster characteristics revealed a different interpretation.

The principal feature separating the two clusters was estimated sleep duration.

Participants in Cluster 0 demonstrated an average estimated sleep duration of approximately 7.9 hours per night, consistent with expected sleep duration for older children and adolescents.

In contrast, participants assigned to Cluster 1 demonstrated an estimated average sleep duration of less than two hours per night.

Such values are biologically implausible within a healthy paediatric population and strongly suggest that this cluster reflects limitations of the simplified movement-based sleep estimation method rather than a genuine behavioural subgroup. Potential explanations include incomplete device wear, irregular overnight movement patterns or sleep schedules that were not adequately captured by the predefined overnight detection window.

Importantly, the remaining lifestyle variables showed little evidence of meaningful separation between the two clusters. Measures of Body Mass Index (BMI), body fat percentage, muscle mass and self-reported physical activity demonstrated no statistically significant differences (all p > 0.05).

These findings indicate that the validated clustering solution was dominated by a probable measurement artefact rather than representing distinct multidimensional lifestyle archetypes.

# 4.5 Association with Problematic Internet Use and Mental Health

Having identified the optimal clustering solution, outcome variables that had been withheld during cluster formation were compared between the two clusters.

The primary outcome, Problematic Internet Use, measured using the Parent–Child Internet Addiction Test (PCIAT), showed no statistically significant difference between clusters (p = 0.818).

Similarly, no significant differences were observed for:

- Depression symptom scores (p = 0.326)
- Severity impairment index (p = 0.551)
- Self-reported computer and internet use (p = 0.772)

The only statistically significant difference identified between the clusters was the Children's Global Assessment Scale (CGAS), with clinician-rated functioning differing significantly between groups (p < 0.001).

However, because this finding was not supported by corresponding differences in Problematic Internet Use, depression symptoms or internet use, it should be interpreted cautiously. The isolated CGAS finding alone does not provide convincing evidence that the identified clusters represent clinically meaningful lifestyle archetypes.

Overall, the primary validated clustering solution therefore provides no evidence that naturally occurring lifestyle groups were associated with Problematic Internet Use.

# 4.6 Exploratory Three-Cluster Analysis

To investigate whether additional behavioural structure might exist within the dataset, an exploratory sensitivity analysis was performed using an alternative clustering configuration consisting of three clusters.

Unlike the primary validated solution, the three-cluster model demonstrated a progressive increase in average PCIAT scores across the identified groups, with mean scores increasing from approximately 23.7 to 27.4 and 33.2, respectively. The overall difference between clusters was statistically significant (p < 0.001).

This pattern suggests that more complex behavioural subgroups associated with increasing problematic internet use may exist within the data.

However, this analysis should be interpreted cautiously for several reasons.

First, the three-cluster solution was not the primary model selected through the validation process. Second, it was conducted as an exploratory sensitivity analysis after completion of the primary analysis. Finally, the findings have not yet been replicated using independent datasets.

Consequently, these results should be regarded as hypothesis-generating rather than confirmatory. They provide an interesting direction for future investigation but do not alter the principal conclusion derived from the validated two-cluster solution.

# 4.7 Summary of Findings

The primary objective of this study was to determine whether objectively measured sleep, physical activity and body composition formed meaningful lifestyle archetypes associated with Problematic Internet Use.

Although the selected K-means solution demonstrated outstanding statistical validation and exceptional stability, closer examination showed that the clustering was driven predominantly by implausible estimates of sleep duration rather than genuine behavioural differences. As a result, no significant associations were observed between the validated lifestyle clusters and Problematic Internet Use, depression symptoms, or reported internet use.

The exploratory three-cluster analysis suggested that more nuanced behavioural patterns may exist and provides an important avenue for future research. Nevertheless, the principal finding of the present study is that the most statistically robust clustering solution did not identify clinically meaningful lifestyle archetypes associated with Problematic Internet Use.



## 5. Discussion

# 5.1 Principal Findings

This study investigated whether objectively measured sleep, physical activity, and body composition could be used to identify meaningful lifestyle archetypes associated with Problematic Internet Use (PIU) in children and adolescents. Using unsupervised machine learning, three clustering algorithms were evaluated following dimensionality reduction with Uniform Manifold Approximation and Projection (UMAP). Among the methods assessed, the K-means algorithm produced the strongest statistical performance, demonstrating excellent internal validity and exceptional reproducibility across repeated stability analyses.

Despite these encouraging validation metrics, detailed examination of the clusters revealed that the separation was driven predominantly by implausible estimates of sleep duration rather than genuine multidimensional lifestyle differences. Consequently, the validated two-cluster solution showed no statistically significant differences in Problematic Internet Use, depression symptoms, severity indices or reported internet use. Although clinician-rated global functioning (CGAS) differed significantly between clusters, this isolated finding was not supported by the remaining outcome measures and should therefore be interpreted cautiously.

An exploratory three-cluster analysis suggested progressively increasing PCIAT scores across clusters, indicating that more complex behavioural subgroups may exist. However, because this analysis was exploratory and was not the primary validated clustering solution, these findings should be regarded as hypothesis-generating rather than confirmatory.

Overall, the primary finding of this study is that the most statistically robust clustering solution did not identify clinically meaningful lifestyle archetypes associated with Problematic Internet Use.

# 5.2 Interpretation of the Null Findings

At first glance, the absence of a significant association between the validated clusters and Problematic Internet Use may appear disappointing. However, within scientific research, well-supported null findings are equally valuable because they refine existing hypotheses and prevent researchers from drawing conclusions that are not supported by the data.

Previous studies have consistently reported associations between shorter sleep duration, lower physical activity, and greater problematic internet use among young people (Kuss & Lopez-Fernandez, 2016; Odgers & Jensen, 2020). However, these studies have generally employed variable-centred statistical methods, such as correlation analyses or regression modelling, which evaluate each lifestyle factor independently. Such approaches are designed to identify linear relationships between individual variables and outcomes but do not determine whether naturally occurring behavioural profiles exist within populations.

The present study adopted a fundamentally different strategy. Rather than asking whether poor sleep predicts PIU, we asked whether combinations of lifestyle behaviours naturally formed distinct groups that differed in PIU. This person-centred approach allows complex interactions between multiple behaviours to emerge directly from the data without imposing predefined assumptions.

The absence of significant differences between the validated clusters therefore does not contradict previous literature. Instead, it suggests that lifestyle behaviours may vary along a continuum rather than forming two clearly distinct behavioural subgroups. This distinction is important because it highlights how different analytical approaches can address different research questions using the same underlying data.

# 5.3 Why Statistical Validation Alone Is Not Enough

One of the most important methodological lessons arising from this study is that excellent statistical validation does not necessarily imply biological or clinical validity.

The selected K-means solution demonstrated a Silhouette Coefficient approaching 0.8, a very low Davies–Bouldin Index and excellent Calinski–Harabasz performance. Furthermore, repeated subsampling and perturbation analyses produced almost identical clustering solutions, with Adjusted Rand Index values approaching one. Collectively, these results indicate that the algorithm consistently identified the same underlying structure within the data.

However, statistical reproducibility alone cannot determine whether the identified structure reflects genuine behavioural phenomena or artefacts introduced during data collection or preprocessing. Inspection of the cluster characteristics revealed that the primary distinguishing feature was estimated sleep duration, with one cluster exhibiting average sleep durations of fewer than two hours per night. Such values are incompatible with normal paediatric physiology and strongly suggest that the clustering algorithm was identifying a systematic measurement issue rather than a true lifestyle archetype.

This observation reinforces an important principle within machine learning: algorithms identify patterns regardless of whether those patterns are clinically meaningful. Consequently, machine learning outputs should always be interpreted within the context of subject-specific knowledge rather than accepted solely on the basis of favourable statistical metrics.

# 5.4 Sleep Estimation and Wearable Devices

The apparent dominance of sleep duration within the clustering solution most likely reflects limitations of the simplified actigraphy-based sleep estimation method employed during feature engineering.

Actigraphy provides an objective and practical method for measuring habitual movement over extended periods and has become widely used in paediatric sleep research because it is considerably less intrusive than laboratory-based polysomnography (van Hees et al., 2015). Nevertheless, actigraphy does not directly measure sleep. Instead, sleep periods are inferred from movement patterns using predefined algorithms and behavioural assumptions.

In the present study, sleep was estimated using low movement occurring between fixed overnight hours. While this simplified approach was appropriate for an exploratory machine learning study, it may have incorrectly classified children with irregular sleep schedules, prolonged nocturnal wakefulness or incomplete device wear. Participants who removed the accelerometer overnight or whose sleep occurred outside the predefined time window may therefore have been assigned implausibly short estimated sleep durations.

These findings highlight the importance of careful preprocessing when applying machine learning to wearable health data. Improvements such as validated sleep detection algorithms, automated non-wear detection and incorporation of circadian rhythm measures may produce more biologically meaningful behavioural representations in future studies.

# 5.5 Comparison with Previous Literature

The findings of this study should be interpreted within the broader context of previous research examining lifestyle behaviours and Problematic Internet Use.

Several systematic reviews have reported consistent associations between excessive internet use and poorer sleep quality, delayed sleep timing, reduced physical activity and poorer mental health outcomes (Kuss & Lopez-Fernandez, 2016). Similarly, Odgers and Jensen (2020) argued that although digital technology is frequently associated with poorer wellbeing, the magnitude of these relationships is often modest and influenced by multiple interacting behavioural and environmental factors.

The present findings are consistent with these observations in several respects. Although the validated clustering solution did not identify meaningful lifestyle archetypes, the exploratory three-cluster analysis demonstrated progressively increasing PCIAT scores across clusters. While these findings require independent replication, they suggest that behavioural heterogeneity may indeed exist but may not be adequately captured by a simple two-cluster model.

Furthermore, previous investigations have generally relied upon questionnaire-derived measures of sleep and physical activity. The use of objective wearable measurements in the present study reduces recall bias and provides a richer behavioural representation, although it introduces additional challenges relating to data quality and preprocessing.

Taken together, these findings suggest that future research should combine objective wearable technologies with more sophisticated behavioural modelling approaches to better characterise the complex relationships between lifestyle behaviours and Problematic Internet Use.

# 5.6 Strengths of the Study

This study has several important methodological strengths.

First, lifestyle behaviours were measured using objective wearable accelerometry rather than relying solely on participant self-report. Objective measurement reduces recall bias and provides a more reliable representation of habitual behaviour.

Second, multiple clustering algorithms were systematically compared before selecting the final model. Evaluating K-means, Agglomerative clustering and DBSCAN reduced dependence on a single analytical technique and increased confidence that the selected solution represented the strongest available model.

Third, extensive internal validation and stability analyses were performed. Many exploratory clustering studies report only a single validation metric, whereas the present study combined multiple complementary measures of clustering quality alongside repeated subsampling and perturbation analyses.

Fourth, outcome variables were intentionally excluded during cluster formation. This reduced the possibility of circular analysis and ensured that the identified behavioural patterns emerged independently of Problematic Internet Use or mental health outcomes.

Finally, the study demonstrates good reproducible research practice by maintaining a transparent analytical workflow from preprocessing through feature engineering, clustering, validation and outcome comparison.

# 5.7 Future Research

The exploratory findings reported here provide several opportunities for future investigation.

Future studies should evaluate more advanced sleep estimation algorithms that incorporate validated accelerometer processing methods and automated non-wear detection. Additional behavioural features, including circadian rhythm metrics, sedentary behaviour, screen-use timing and sleep regularity, may provide more informative representations of lifestyle behaviour.

Alternative clustering approaches, including Gaussian Mixture Models, spectral clustering or latent profile analysis, may also identify behavioural archetypes that were not captured by the algorithms evaluated in the present study.

Finally, replication using independent paediatric cohorts will be essential to determine whether the exploratory three-cluster findings represent genuine behavioural subgroups or chance observations within the present dataset.


## 6. Limitations

The most important limitation concerns the sleep estimation methodology. Sleep duration was estimated indirectly from wrist movement using predefined overnight windows rather than measured using polysomnography, the clinical gold standard for sleep assessment. Although actigraphy is widely accepted for estimating habitual sleep, simplified movement-based algorithms may misclassify periods of inactivity, irregular sleep schedules or device non-wear, leading to implausible estimates. This limitation likely contributed to the emergence of one cluster characterised by unrealistically short sleep duration and may have influenced the clustering results.

A second limitation relates to sample size following quality control. Although the Healthy Brain Network initially contained data from nearly 4,000 participants, only 996 participants had wearable actigraphy recordings available and, after quality-control procedures, the final analytical sample consisted of 733 participants. Excluding participants with incomplete or poor-quality recordings improved data reliability but may have reduced statistical power and limited the representativeness of the sample.

The study was also cross-sectional, meaning that all variables were measured at a single point in time. Consequently, causal relationships between lifestyle behaviours and Problematic Internet Use cannot be inferred. It remains unclear whether unhealthy lifestyle behaviours contribute to problematic internet use, whether problematic internet use influences lifestyle behaviours, or whether both are influenced by other biological, psychological or environmental factors.

Another limitation concerns the selection of lifestyle variables. Although sleep, physical activity and body composition represent important behavioural domains, they do not fully capture the complexity of children's lifestyles. Potentially informative variables such as dietary habits, screen time timing, socioeconomic status, family environment, academic demands and mental health history were not incorporated into the clustering process and may have contributed additional behavioural structure.

Furthermore, clustering analyses are inherently algorithm-dependent. Although three commonly used clustering methods were compared, other approaches—including Gaussian Mixture Models, spectral clustering and latent profile analysis—may have identified different behavioural patterns. Consequently, the absence of clinically meaningful clusters within the present analysis should not be interpreted as definitive evidence that lifestyle archetypes do not exist.

Finally, the exploratory three-cluster solution should be interpreted with caution. Although progressively increasing PCIAT scores suggest that more nuanced behavioural subgroups may exist, this analysis was not the primary validated model and has not yet been replicated in an independent dataset. These findings should therefore be regarded as exploratory and hypothesis-generating rather than conclusive.

## 7. Conclusion

This study explored whether objectively measured sleep, physical activity and body composition could be used to identify lifestyle archetypes associated with Problematic Internet Use in children and adolescents using unsupervised machine learning.

Among the clustering approaches evaluated, the K-means algorithm produced the strongest statistical performance, demonstrating excellent internal validity and exceptional stability across repeated validation analyses. However, closer examination revealed that the validated two-cluster solution was driven predominantly by implausible estimates of sleep duration, suggesting that the identified clusters reflected limitations of the sleep estimation process rather than genuine behavioural archetypes.

Consequently, no significant differences were observed between the validated clusters for Problematic Internet Use, depression symptoms, severity indices or reported internet use. Although clinician-rated global functioning differed significantly, this isolated finding was insufficient to support the existence of clinically meaningful lifestyle subgroups.

The exploratory three-cluster analysis suggested that more complex behavioural patterns may exist within the dataset and provides an important direction for future research. Nevertheless, these findings require independent validation before any firm conclusions can be drawn.

More broadly, this study highlights an important principle for the application of machine learning in health research: statistical robustness alone does not guarantee biological or clinical relevance. Machine learning algorithms are highly effective at detecting structure within complex datasets, but those structures must always be interpreted in conjunction with domain knowledge and careful data quality assessment.

Future work should incorporate more sophisticated actigraphy processing methods, additional behavioural variables and external validation using independent cohorts. Such improvements may help identify clinically meaningful lifestyle archetypes that contribute to a better understanding of Problematic Internet Use and support the development of targeted interventions for children and adolescents.

---

## References
Alexander, L. M., Escalera, J., Ai, L., Andreotti, C., Febre, K., Mangone, A., ... Milham, M. P. (2017). An open resource for transdiagnostic research in pediatric mental health and learning disorders. Scientific Data, 4, 170181. https://doi.org/10.1038/sdata.2017.181
Buysse, D. J. (2014). Sleep health: Can we define it? Does it matter? Sleep, 37(1), 9–17.
Calinski, T., & Harabasz, J. (1974). A dendrite method for cluster analysis. Communications in Statistics, 3(1), 1–27.
Davies, D. L., & Bouldin, D. W. (1979). A cluster separation measure. IEEE Transactions on Pattern Analysis and Machine Intelligence, 1(2), 224–227.
Ester, M., Kriegel, H. P., Sander, J., & Xu, X. (1996). A density-based algorithm for discovering clusters in large spatial databases with noise. Proceedings of the Second International Conference on Knowledge Discovery and Data Mining, 226–231.
Hubert, L., & Arabie, P. (1985). Comparing partitions. Journal of Classification, 2(1), 193–218.
James, G., Witten, D., Hastie, T., & Tibshirani, R. (2021). An Introduction to Statistical Learning: With Applications in R (2nd ed.). Springer.
Kuss, D. J., & Lopez-Fernandez, O. (2016). Internet addiction and problematic internet use: A systematic review of clinical research. World Journal of Psychiatry, 6(1), 143–176.
MacQueen, J. (1967). Some methods for classification and analysis of multivariate observations. Proceedings of the Fifth Berkeley Symposium on Mathematical Statistics and Probability, 281–297.
McInnes, L., Healy, J., & Melville, J. (2018). UMAP: Uniform manifold approximation and projection for dimension reduction. arXiv:1802.03426.
Odgers, C. L., & Jensen, M. R. (2020). Annual Research Review: Adolescent mental health in the digital age. Journal of Child Psychology and Psychiatry, 61(3), 336–348.
Rousseeuw, P. J. (1987). Silhouettes: A graphical aid to the interpretation and validation of cluster analysis. Journal of Computational and Applied Mathematics, 20, 53–65.
Sallis, J. F., Bull, F., Guthold, R., Heath, G. W., Inoue, S., Kelly, P., ... Hallal, P. C. (2016). Progress in physical activity over the Olympic quadrennium. The Lancet, 388(10051), 1325–1336.
Shaffer, D., Gould, M. S., Brasic, J., Ambrosini, P., Fisher, P., Bird, H., & Aluwahlia, S. (1983). A children's global assessment scale (CGAS). Archives of General Psychiatry, 40(11), 1228–1231.
van Hees, V. T., Sabia, S., Anderson, K. N., Denton, S. J., Oliver, J., Catt, M., ... Singh-Manoux, A. (2015). A novel, open access method to assess sleep duration using a wrist-worn accelerometer. PLoS ONE, 10(11), e0142533.
