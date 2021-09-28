# COVID-19.policy.github.io

This public repository contains the materials for reproducing the results described in the manuscript entitled “A global analysis of the COVID-19 policy activity levels and evolution patterns”.

# Authors

Maintainer: Meiqian Chen (mqchen@stu.scu.edu.cn)

    Meiqian Chen
    
    Yucheng Dong

# Data support

The data used in this manuscript is based on the [Oxford Covid-19 Government Response Tracker (OxCGRT)](https://github.com/OxCGRT/covid-policy-tracker) dataset, which collects systematic information on which governments have taken which measures. 

```
T. Hale et al., A global panel database of pandemic policies (Oxford COVID-19 Government Response Tracker). *Nat. Hum. Behav*. ***5\***, 529-538 (2021).
T. Hale, S. Webster, A. Petherick, T. Phillips, & B. Kira, Oxford COVID-19 government response tracker (OxCGRT). (2020).
T. Hale et al., “Variation in Government Responses to COVID-19” Version 11.0. Blavatnik School of Government Working Paper. (2021; https://github.com/OxCGRT/covid-policy-tracker/blob/master/documentation/index_methodology.md ).
```

# Material description

[Supplementary Figures and Tables.pdf](https://github.com/Meiqian-Chen/COVID-19.policy.github.io/blob/main/Supplementary%20Figures%20and%20Tables.pdf): some figures discussed in the section of Robustness Checks and the list of countries discussed in this paper.

[policy_activity_level_(DEswan-model).R](https://github.com/Meiqian-Chen/COVID-19.policy.github.io/blob/main/policy_activity_level_(DEswan-model).R): the R code for measuring the number of countries with significant changes in government policies, new confirmed cases and new deaths.

[changepoint_detective.R](https://github.com/Meiqian-Chen/COVID-19.policy.github.io/blob/main/changepoint_detective.R): the R code for estimating change points of the time series of the global activity level in policy.

[clustering_graph_mclust_kmeans_hclust.R](https://github.com/Meiqian-Chen/COVID-19.policy.github.io/blob/main/clustering_graph_mclust_kmeans_hclust.R): the R code for clustering the selected 80 countries based on the cumulative strictness scores associated with the 16 government policy indicators at each time point using Graph clustering, Model-based clustering, Hierarchical clustering, and K-means method.

[clustering_ensemble.R](https://github.com/Meiqian-Chen/COVID-19.policy.github.io/blob/main/clustering_ensemble.R): the R code for extracting the information from the daily clustering results from March 1, 2020 to September 15, 2021 to explore the main categories of evolving global policy patterns.

In addition, we collect the data needed for the calculation process and the results in this paper in the folder [data](https://github.com/Meiqian-Chen/COVID-19.policy.github.io/tree/main/data). We also provide the replication code and data to complete all figures.

