<a name="readme-top"></a>

# Predicting non-shows at outpatient appointments in internal medicine using machine learning models

<p align="justify">
The high prevalence of patient absenteeism in medical appointments presents significant challenges for both healthcare providers and patients, resulting in delays in service delivery and increasing operational inefficiencies. Addressing this issue is crucial within the internal medicine department, a cornerstone of comprehensive adult healthcare that manages various chronic and complex conditions. To mitigate absenteeism, we present a novel application of machine learning models specifically designed to predict the risk of patient absenteeism in the internal medicine department of Fundaci ´on Valle del Lili, a high-complexity hospital center in Colombia. Leveraging an institutional database, we conducted a statistical analysis to identify critical variables influencing absenteeism risk, including clinical and sociodemographic factors, as well as characteristics of previously attended appointments. Our study evaluated seven distinct machine learning models, explored various data processing techniques, and addressed class imbalance through oversampling and undersampling strategies. Hyperparameter optimization was performed for each model configuration, culminating in the selecting of the GradientBoosting model, which demonstrated outstanding performance when combined with standardized data and balanced using the ADASYN technique. The selected model exhibited a predictive accuracy of 82.41 ± 0.86 %, with an AUC value of 0.89, an F1-Score of 81.07%, and a recall of 81.19% in cross-validation experiments. These results highlight the potential of our experimental approach to identify the most suitable model for proactively predicting patients at high risk of absenteeism, with the aim of optimizing resource allocation and enhancing the quality of medical care in internal medicine in the future. Our methodology provides a foundation for reducing operational inefficiencies and strengthening intervention strategies, which will benefit both healthcare providers and patients by enabling more timely and effective care, ultimately contributing to improved patient outcomes and institutional efficiency.
</p>

## Dependencies

The current release depends on the following Python libraries:

pandas == 1.5.3

scikit-learn == 1.2.1

imbalanced-learn == 0.10.1

yellowbrick == 1.5

numpy == 1.23.5

seaborn == 0.12.2

## Dataset

The [database](database_non-shows.xlsx) contains historical data for 12,153 patients seen in the specialty of internal medicine between 2019 and 2022.

## Folders
The [DataAnalysis](NonShowsCodes/DataAnalysis) folder contains the exploratory analysis of the database.

The [GridSearch](NonShowsCodes/GridSearch) folder  contains the hyperparameter tuning for each computational model by balancing method.

The [Models](NonShowsCodes/Models) folder contains the performance metrics and graphs for each computational model by class balancing group.

