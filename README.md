# Bayesian House price Factor analysis and Prediction

This project explores Bayesian varying intercept models to predict **house selling prices** and analyze the factors influencing them. It showcases a **Bayesian modeling workflow**, including **posterior predictive checking** and **model selection**.

The contents of this repository can serve as a **template** for those interested in Bayesian modeling, house price prediction, or **hierarchical regression models**. Feel free to use and modify the provided scripts for your own work.

---

## Project Overview

- **Objective**: Predict house prices in King County, USA, using Bayesian inference.
- **Approach**: Utilize Bayesian **varying intercept models** to model price variations.
- **Methods Used**:
  - Data preprocessing and feature engineering
  - Bayesian regression modeling using **Stan**
  - Model comparison and selection
  - Posterior predictive checking for model validation
  - Uncertainty quantification in price predictions

---

## 📊 Dataset

The dataset used is **House Sales in King County, USA**, available on:  
[**House Sales Prediction Dataset**](https://www.kaggle.com/harlfoxem/housesalesprediction)

### Dataset Features:

- **House prices**
- **Location variables** (zipcode, longitude, latitude)
- **House characteristics** (bedrooms, bathrooms, sqft_living, etc.)
- **Time-related attributes** (date of sale, built year)

Ensure the dataset is placed in the **`data/`** folder.

---

## 📂 Files in This Repository

- **`price_prediction.rmd`** – The main R Markdown file containing the Bayesian modeling workflow.
- **`data/`** – Directory for dataset files (ensure the dataset is placed here).
- **`models/`** – Stores model results, predictions, and visualizations.
- **`plots/`** – Stores visualizations.

---

## 🔧 Prerequisites

The project has been tested on **Windows 10** and requires the following dependencies:

### Install R
Ensure you have **R (version 3.5.2 or later)** installed. Download from:  
[R Project Official Website](https://cran.r-project.org/)

### Install Stan  
Stan is required for Bayesian modeling. Install `rstan` in R using:
```r
install.packages("rstan", dependencies=TRUE)
```

### Required R Packages
```r
install.packages(c("rstanarm", "bayesplot", "ggplot2", "dplyr", "tidybayes", "loo"))
```



## 🛠 Troubleshooting & Common Issues

### **Stan Compilation Errors**  
Ensure that your **C++ toolchain** is properly configured. If you are using **Windows**, install **RTools** by running the following command in R:
```r
install.packages("installr")
installr::install.Rtools()
```

### **Slow Sampling**  
If the model takes a long time to sample, consider reducing the **number of iterations** or **chains** to speed up computation.

### **Memory Issues**  
To optimize memory usage:
- Decrease the **sample size**.
- Enable automatic saving of compiled models using:
  ```r
  rstan_options(auto_write = TRUE)
  ```
