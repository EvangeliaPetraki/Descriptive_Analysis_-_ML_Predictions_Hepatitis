# Hepatitis C Dataset Analysis and Classification
This project analyzes and classifies data from a [Hepatitis C Dataset](https://www.kaggle.com/datasets/fedesoriano/hepatitis-c-dataset). It includes data exploration, visualization, data cleaning, and predictive modeling using ***Support Vector Machines (SVM)*** and ***Random Forest*** classifiers. The purpose is to understand key characteristics of individuals in different hepatitis-related categories and to build predictive models to classify individuals based on their health indicators.

## Libraries used:
* **tidyverse**: Data manipulation and visualization.
* **VIM**: For imputation of missing values.
* **e1071**: For Support Vector Machine (SVM) modeling.
* **caret**: Provides functions for creating training and test datasets, and evaluating models.
* **randomForest**: For building Random Forest models.

## Dataset Overview

### Loading and Initial Exploration
The dataset, HepatitisCdata.csv, is loaded into the HCR dataframe:

* Category and Sex columns are converted to categorical data types.
* Basic structure and statistics are displayed to understand distributions.

## Data Visualization
Visualizations provide insights into age, gender, and lab value distributions across different hepatitis categories:

* **Category and Gender Distribution**: Bar plots of category and gender distributions.
* **Age Distribution**: A histogram shows age distribution across all categories.
* **Biochemical Markers**: Box plots for various liver function markers (Albumin, ALP, ALT, AST, GGT, Bilirubin, Cholinesterase, Total Protein, and Cholesterol) visualize distributions across categories.
  
## Data Cleaning

### Missing Data Imputation
Missing values in key variables are imputed using the k-Nearest Neighbors (kNN) approach from the VIM package. This step creates a clean dataset HCRclean, and imputed columns are merged back into HCR.

### Category Collapsing
The Category column is consolidated into two levels:

* 0=Blood Donor: Represents blood donors and non-hepatitis individuals.
* 1=Hepatitis: Combines fibrosis and cirrhosis cases under one level.

## Model Building and Evaluation
The dataset is split into training (75%) and testing (25%) subsets for model training and validation.

### 1. Support Vector Machine (SVM)
An SVM classifier with a linear kernel is trained on the dataset:

* The model’s performance is evaluated using a confusion matrix on the test set.

### 2. Random Forest Models
Random Forest models with various numbers of trees (7, 8, 10, 15, and 20) are trained and tested to find an optimal tree count:

* Each model’s accuracy is assessed using confusion matrices.
