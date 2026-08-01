# Do Sleep and Activity "Types" in Kids Relate to Problematic Internet Use? A Simple Research Report

### Abstract

We looked at data from nearly 4,000 children and teenagers to see whether the way they sleep, move, and are built (their body composition) sorts them into different "lifestyle types," and whether those types are connected to unhealthy internet habits or mental health. Using a wrist-worn activity tracker and body measurements, we grouped 733 children into two statistically distinct groups. But when we looked closely, this split mostly reflected a **measurement problem**, not a real lifestyle difference, and it was **not** linked to internet use. A second, more exploratory grouping hinted at a real link worth studying further. This paper explains the whole process in plain language, defining every technical word along the way.

---

## 1. Introduction

Grown-ups often worry that children who sleep less or move less might be more likely to spend too much time online in an unhealthy way — something researchers call **problematic internet use (PIU)**, meaning internet use that starts to interfere with someone's daily life, sleep, relationships, or mood (Young, 1998). This project asked: can we find natural "lifestyle types" in children — based only on sleep, activity, and body measurements — and do any of those types line up with higher problematic-internet-use scores?

This is called an **exploratory** study, meaning we were looking for patterns without already knowing what we'd find, rather than testing one specific prediction. It is also **unsupervised**, meaning the computer was not told which children had problems and which didn't — it grouped children purely by their lifestyle numbers, blind to the outcome, so the grouping couldn't "cheat" by using the answer in advance.

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

## 3. Data and Methods

The data came from the Healthy Brain Network, a large research project run by the Child Mind Institute that collects health and behavior information from thousands of children and teenagers in the New York area (Alexander et al., 2017). Our version of the dataset had **3,960 children**, but only **996 of them** had worn an activity tracker, and after removing recordings that were too short or unreliable, **733 children** had good enough tracker data to use.

**Step 1 — Build a "lifestyle fingerprint" for each child.**
The tracker records movement every 5 seconds, day and night, for several days — far too much raw detail to study directly. We reduced each child's recording to five simple numbers: average sleep length, how consistent that sleep was, average daytime activity level, how consistent that activity was, and whether weekday activity differed from weekend activity. We defined "asleep" as very low movement between 10pm and 8am, a common shortcut used in accelerometer research (an approach similar to the ENMO-based methods described by van Hees et al., 2015), but it is a simplified estimate, not a medical sleep study.

We combined these five numbers with five more: BMI, body fat percentage, muscle mass, and a self-reported physical-activity score, for **10 lifestyle numbers per child** in total. On purpose, we did **not** include age, sex, or any internet-use/mental-health score when forming the groups — those were saved to compare afterward, so the grouping couldn't be secretly influenced by the answer we were curious about.

**Step 2 — Simplify and group the children.**
We used UMAP to compress the 10 numbers per child down to a more manageable shape. Then we tried three different grouping methods:

- **K-means**, which looks for round, evenly-sized groups (MacQueen, 1967)
- **Agglomerative (hierarchical) clustering**, which builds groups by repeatedly merging the most similar children together
- **DBSCAN**, which looks for dense clumps and is willing to say some children don't fit any group (Ester, Kriegel, Sander, & Xu, 1996)

We tested several ways of measuring how good each grouping was, and also checked how stable each grouping was — that is, whether it stayed roughly the same if we reran it on a random 80% of the children, or added a small amount of random "noise" to the numbers first.

**Step 3 — Compare the groups to internet use and mental health.**
Only after the groups were formed did we look at each child's PCIAT score, CGAS score, a depression-symptom score, and self-reported screen time, to see if these differed across groups.

## 4. Results

**The clustering found two groups**, produced by the K-means method, and this was the cleanest, most reliable result of the three methods (silhouette score 0.79, close to the best possible). It was also extremely stable: rerunning it on random subsets of children, or adding random noise, gave almost exactly the same two groups every time (ARI close to 1.0, meaning near-perfect agreement).

However, when we looked at *what* separated the two groups, it turned out to be **almost entirely one thing: estimated sleep length**. Group A's estimated sleep averaged a normal-sounding 7.9 hours. Group B's estimated sleep averaged under **2 hours a night** — which is not a realistic amount of sleep for a healthy child. This strongly suggests Group B contains children whose tracker had trouble measuring their sleep properly (perhaps because they took the device off, or their sleep didn't fit our simple "10pm–8am, low movement" rule), rather than genuinely being children who barely sleep. Every other lifestyle measure — BMI, body fat, muscle mass, self-reported activity — showed **no meaningful difference** between the two groups (p > 0.05 for all of these).

**Did the two groups differ in internet use or mental health?** No. PCIAT scores, the related severity category, depression-symptom scores, and reported screen-time hours were all statistically similar between the two groups. Only the clinician-rated CGAS score differed — but since none of the other outcome measures agreed with it, this single result isn't strong evidence on its own.

**A follow-up check with different settings** — asking the computer for three groups instead of two — found a more interesting pattern: average PCIAT scores rose in clear steps across the three groups (about 24, 27, and 33 points), a statistically significant difference. This is only from one alternative run, so it should be treated as a promising lead, not a proven finding.

## 5. Discussion

The main, most trustworthy result of this project is a **null result**: the cleanest, most stable way of splitting these children by lifestyle data did not turn out to reveal a real behavioral difference, and it showed no link to problematic internet use. This is a useful and honest scientific outcome — it tells us that a simple two-group split isn't the right way to find this relationship, at least not with this measurement approach.

At the same time, the three-group follow-up check hints that a real relationship between lifestyle and internet use might exist, just not in the form the main analysis captured. This kind of "maybe, but not confirmed" result is common and valuable in exploratory research: it points toward where a bigger, more careful follow-up study should look next, rather than claiming a discovery too early.

## 6. Limitations

- Only 733 of 3,960 children (about 1 in 5) had usable tracker data, so results may not represent all children in the study.
- Sleep was estimated using a simple movement-based rule, not a medical sleep test, and this rule appears to have failed for some children.
- PCIAT and CGAS are **screening tools**, not clinical diagnoses, and results here describe group-level associations, not individual predictions.
- The promising three-group result came from a single alternative analysis and needs independent confirmation.

## 7. Conclusion

This project carefully built a way to summarize children's sleep and activity from wearable data, and rigorously tested multiple ways of grouping children by lifestyle. Its most reliable grouping turned out to reflect a data-quality issue rather than a genuine lifestyle type, and showed no link to problematic internet use. A secondary, less certain result suggested such a link might exist and is worth investigating with better data in future research.

---

## References

Alexander, L. M., Escalera, J., Ai, L., et al. (2017). An open resource for transdiagnostic research in pediatric mental health and learning disorders. *Scientific Data*, 4, 170181. https://doi.org/10.1038/sdata.2017.181

Ester, M., Kriegel, H.-P., Sander, J., & Xu, X. (1996). A density-based algorithm for discovering clusters in large spatial databases with noise. *Proceedings of the Second International Conference on Knowledge Discovery and Data Mining (KDD-96)*, 226–231.

MacQueen, J. (1967). Some methods for classification and analysis of multivariate observations. *Proceedings of the Fifth Berkeley Symposium on Mathematical Statistics and Probability*, 1, 281–297.

McInnes, L., Healy, J., Saul, N., & Großberger, L. (2018). UMAP: Uniform Manifold Approximation and Projection. *Journal of Open Source Software*, 3(29), 861. https://doi.org/10.21105/joss.00861

Shaffer, D., Gould, M. S., Brasic, J., Ambrosini, P., Fisher, P., Bird, H., & Aluwahlia, S. (1983). A children's global assessment scale (CGAS). *Archives of General Psychiatry*, 40(11), 1228–1231.

van Hees, V. T., Sabia, S., Anderson, K. N., et al. (2015). A novel, open access method to assess sleep duration using a wrist-worn accelerometer. *PLOS ONE*, 10(11), e0142533.

Young, K. S. (1998). Internet addiction: The emergence of a new clinical disorder. *CyberPsychology and Behavior*, 1(3), 237–244.