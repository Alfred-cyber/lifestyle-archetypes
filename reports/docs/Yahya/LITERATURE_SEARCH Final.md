# Literature Review

## Problem Statement

Problematic internet use (PIU) in children and adolescents is linked to depression, ADHD,
poor sleep and functional impairment [1]. Most research predicts PIU from single risk
factors, or looks at sleep, activity and body composition as separate things. This
project takes a different approach. It groups children by lifestyle first, then checks
how those groups relate to PIU and mental health screening scores. That matches the
brief's core question. We are not asking whether we can predict PIU. We are asking who
these children are and which lifestyle patterns actually matter.

## Scale of the Problem

Prevalence estimates for PIU vary a lot depending on the tool and cutoff used, ranging
from 0.5% to 84% across studies [2]. Estimates that use more consistent methods sit
lower. One Spanish sample found 33% using a DSM-5 based cutoff, and a meta-analysis of
84 studies found a pooled prevalence of 8.6% for gaming disorder specifically [3]. WHO's
most recent cross-national survey of adolescents found 11% showing signs of problematic
social media use and 12% at risk of problematic gaming, and both numbers have been rising
since 2018 [4]. There is no single agreed figure, but under most measures a meaningful
share of children are affected, and the trend is upward. 

## Who Is in the Dataset?

The Healthy Brain Network (HBN) is a Child Mind Institute biobank of around 10,000
children and adolescents aged 5 to 21 in the New York area. It covers psychiatric,
behavioural, cognitive and lifestyle data alongside imaging, EEG, genetics and actigraphy
[5]. It's a clinically enriched, community recruited sample, not a general population
one, so that should be kept in mind when interpreting how far any findings generalise.

The Kaggle release this project uses was originally set up as a prediction task: use
activity, fitness and internet addiction test data to flag early signs of PIU [6]. One
public entry to that competition only reached a Quadratic Weighted Kappa of 0.35
predicting PIU severity [7], which suggests prediction from this data is genuinely hard.
That supports moving to a segmentation approach instead.

A separate HBN study of 564 children aged 7 to 15 found PIU was linked to depressive
disorders, combined type ADHD, general impairment and sleep disturbance, independent of
other factors [8]. This is a reason to compare clusters against PIU, general functioning
and depressive symptoms together, rather than PIU on its own.

## Do Lifestyle Clusters Exist in Children?

A UK Millennium Cohort Study used k-means on screen time, activity, diet and sleep, and
found healthy, mixed and unhealthy clusters linked to three year changes in adiposity.
Unfavourable clusters rose from 29% of children aged 2 to 5 up to 74% by age 16 to 19.
Sleep is often left out of this kind of analysis, and long term studies are rare [9]. A
Spanish study clustered 663 adolescents by activity, screen time and sleep into three
groups, and only 28% met recommended levels across all three [10]. Another study argues
that clustering can pick up on behaviour combinations that regression style analysis
would miss [11]. A longitudinal UK study followed children from age 7 to 14 and found
they do move between healthy, mixed and unhealthy clusters over time [12].

## Do Sleep and Activity Relate to PIU?

A review of 12 studies found adolescent sleep was consistently and negatively correlated
with PIU, affecting both sleep quality and quantity, and this relationship was shaped by
sex, parental education and whether the internet use was for leisure or academic reasons
[13]. A Korean study found physical activity was negatively associated with PIU, and part
of that link ran through better sleep satisfaction and lower stress [14]. That supports
treating sleep and activity as related to PIU together rather than as two separate
predictors. A wider review found problematic device use consistently harmed sleep, and
sleep seemed to be part of how device use affects mental health more broadly [15].

## Measuring Behaviour from Wearable Data

Sleep is usually pulled from raw accelerometer data using an approach developed by van
Hees and colleagues. It defines sleep as sustained inactivity, meaning no change in wrist
angle greater than 5 degrees for 5 minutes within a defined sleep window [16]. When this
was checked against sleep diaries and polysomnography, the algorithm's estimate ran about
3 to 11 minutes longer than diary reported sleep [17]. It's a useful low cost proxy, not
a clinical sleep study. GGIR is the standard open source package that implements this
[18].

## Forming Groups Without Assuming Them in Advance

UMAP is the standard method for compressing lifestyle features down to something
workable while keeping both local and global structure in the data [19]. K-means looks
for compact, evenly sized clusters [20]. DBSCAN looks for dense regions and can leave
some points unclustered [21]. These two methods behave differently enough that testing
both, rather than picking one by default, makes sense.

Keeping age, sex and outcome scores out of the clustering step, and only using them
afterward for comparison, follows a well established idea in this field. Variable
centered methods assume everyone follows the same pattern. Person centered methods,
including k-means, hierarchical clustering and latent profile analysis, look for
subgroups instead [22]. A Nordic study of adolescents showed why this distinction
matters. A variable centered analysis of three mental health indicators found they all
loaded onto one factor, but a person centered cluster analysis of the same three
indicators found seven distinct profiles with different links to psychosocial conditions
[23].

## Validating and Stabilising the Clusters

Silhouette score [24], the Davies Bouldin index [25] and the Calinski Harabasz index [26]
are the standard tools for comparing cluster solutions. All three rely on cluster
centroids, which makes them sensitive to outliers and skewed data [27]. That matters here
because BMI and activity scores are often skewed in paediatric samples.

These indices can look good even when a solution isn't actually stable, so a separate
stability check is needed. One study reran a UMAP embedding 100 times with different
random seeds and found the silhouette and Davies Bouldin scores stayed consistent [28].
That's a useful precedent for reporting stability directly, through subsampling or added
noise, rather than just asserting it. A study clustering fibromyalgia patients combined
several validity indices with the adjusted Rand index and repeated bagging of the data to
confirm consistency before drawing clinical conclusions [29]. Testing more than one
clustering algorithm also matters because internal and external validity can pull apart.
One comparison found DBSCAN scored best on internal metrics despite matching external
ground truth labels less well than other methods [30].

## What the Outcome Measures Show

PCIAT is a 20 item scale completed by parents, measuring compulsivity, escapism and
dependency related to internet use. It's based on Young's early description of internet
addiction [31,32]. CGAS is a clinician rated scale from 1 to 100 describing a child's
overall functioning. Scores above 70 are typical, and scores below 60 indicate a clear
clinical case [33]. As noted above, HBN data has already linked PIU to depressive
symptoms and general impairment in this same cohort [8]. That supports comparing
clusters against PCIAT, CGAS and a depression score together.

## Precedent for This Pipeline

One healthcare study standardised its features, reduced dimensionality with UMAP,
selected a cluster count using silhouette, Dunn and Davies Bouldin scores, then tested
group differences with t-tests, Mann Whitney U and chi square tests [34]. That's the same
sequence used in this project.

---

## Bibliography

1. Restrepo A, et al. Problematic internet use in children and adolescents: Associations
   with psychiatric disorders and impairment. Child Adolesc Psychiatry Ment Health. 2020.
2. [Source not fully attributed]. Relationship between Problematic Internet Use and
   emotional variables in childhood and adolescence: systematic review of longitudinal
   evidence. 2025.
3. [Source not fully attributed]. Prevalence of problematic Internet use and problematic
   gaming in Spanish adolescents. 2023.
4. World Health Organization Regional Office for Europe. Teens, screens and mental
   health [news release]. Copenhagen: WHO/Europe; 2024 Sep 25.
5. Alexander LM, Escalera J, Ai L, Andreotti C, Febre K, Mangone A, et al. An open
   resource for transdiagnostic research in pediatric mental health and learning
   disorders. Sci Data. 2017;4:170181.
6. Child Mind Institute. Child Mind Institute and Kaggle Launch Competition to Predict
   Teen Internet Addiction [news release]. 2024.
7. Wong E. Predicting Problematic Internet Use in Children [blog post]. Medium; 2024 Dec
   31.
8. Restrepo A, et al. Problematic internet use in children and adolescents: Associations
   with psychiatric disorders and impairment. medRxiv. 2019.
9. [Source not fully attributed]. Clusters of diet, physical activity, screen-time and
   sleep among adolescents and associations with 3-year change in indicators of
   adiposity. PLoS One. 2024.
10. [Source not fully attributed]. Moderate to Vigorous Physical Activity, Screen Time
    and Sleep Time Profiles: A Cluster Analysis in Spanish Adolescents. Int J Environ Res
    Public Health. 2023.
11. [Source not fully attributed]. Lifestyle Behavior Patterns and Their Association with
    Active Commuting to School Among Spanish Adolescents: A Cluster Analysis. 2025.
12. [Source not fully attributed]. Change in clusters of lifestyle behaviours from
    childhood to adolescence: a longitudinal analysis. Eur J Pediatr. 2024.
13. Kokka I, Mourikis I, Nicolaides NC, Darviri C, Chrousos GP, Kanaka-Gantenbein C,
    Bacopoulou F. Exploring the Effects of Problematic Internet Use on Adolescent Sleep:
    A Systematic Review. Int J Environ Res Public Health. 2021;18(2):760.
14. [Source not fully attributed]. Associations of physical activity with sleep
    satisfaction, perceived stress, and problematic Internet use in Korean adolescents.
    2014.
15. [Source not fully attributed]. Adolescents' interactive electronic device use, sleep
    and mental health: a systematic review of prospective studies. 2024.
16. van Hees VT, Sabia S, Anderson KN, Denton SJ, Oliver J, Catt M, et al. A Novel, Open
    Access Method to Assess Sleep Duration Using a Wrist-Worn Accelerometer. PLoS One.
    2015;10(11):e0142533.
17. van Hees VT, Sabia S, Jones SE, Wood AR, Anderson KN, Kivimäki M, et al. Estimating
    sleep parameters using an accelerometer without sleep diary. Sci Rep. 2018;8:12975.
18. Migueles JH, Rowlands AV, Huber F, Sabia S, van Hees VT. GGIR: A research
    community driven open source R package for generating physical activity and sleep
    outcomes from multi-day raw accelerometer data. J Meas Phys Behav. 2019;2(3):188-96.
19. McInnes L, Healy J, Melville J. UMAP: Uniform Manifold Approximation and Projection
    for Dimension Reduction. arXiv:1802.03426 [Preprint]. 2018.
20. MacQueen J. Some methods for classification and analysis of multivariate
    observations. In: Proc 5th Berkeley Symp Math Stat Probab. Vol 1. 1967. p. 281-97.
21. Ester M, Kriegel HP, Sander J, Xu X. A density based algorithm for discovering
    clusters in large spatial databases with noise. In: Proc KDD-96. 1996. p. 226-31.
22. [Source not fully attributed]. Representing subpopulations with latent profile
    analysis: a non-technical introduction using exercisers' goal orientation adoption
    profiles. J Behav Med. 2025.
23. [Source not fully attributed]. Poor mental health and adverse psychosocial
    conditions among adolescents in the Nordic countries: contrasting variable and
    person centered analyses. 2025.
24. Rousseeuw PJ. Silhouettes: A graphical aid to the interpretation and validation of
    cluster analysis. J Comput Appl Math. 1987;20:53-65.
25. Davies DL, Bouldin DW. A cluster separation measure. IEEE Trans Pattern Anal Mach
    Intell. 1979;1(2):224-7.
26. Calinski T, Harabasz J. A dendrite method for cluster analysis. Commun Stat.
    1974;3(1):1-27.
27. [Source not fully attributed]. High-Dimensional BWDM: A Robust Nonparametric
    Clustering Validation Index for Large-Scale Data. arXiv:2510.14145. 2025.
28. [Source not fully attributed]. Exploiting correlations in multi-coincidence Coulomb
    explosion patterns for differentiating molecular structures using machine learning.
    arXiv:2509.03776. 2025.
29. [Source not fully attributed]. Multi-Dimensional Validation of the Integration of
    Syntactic and Semantic Distance Measures for Clustering Fibromyalgia Patients in the
    Rheumatic Monitor Big Data Study. 2024.
30. [Source not fully attributed]. Unsupervised Learning: Comparative Analysis of
    Clustering Techniques on High-Dimensional Data. arXiv:2503.23215. 2025.
31. Young KS. Internet addiction: The emergence of a new clinical disorder.
    CyberPsychology Behav. 1998;1(3):237-44.
32. Child Mind Institute Healthy Brain Network. Parent-Child Internet Addiction Test
    (PCIAT). Scientific Data Portal. 2018.
33. Shaffer D, Gould MS, Brasic J, Ambrosini P, Fisher P, Bird H, Aluwahlia S. A
    children's global assessment scale (CGAS). Arch Gen Psychiatry. 1983;40(11):1228-31.
34. [Source not fully attributed]. Unsupervised Clustering of 41,728 Emergency
    Department Visits: Insights into Patient Profiles and KTAS Reliability. Healthcare
    (Basel). 2025;13(23):3073.


