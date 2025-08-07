Project 1 - Insurance Pricing Using GLM in R

This project demonstrates how to simulate and analyze insurance data using **Generalized Linear Models (GLMs)** in R, focusing on automobile insurance. It includes data simulation, preprocessing, frequency and severity modeling, diagnostics, and visualization.

---

## Project Objectives

- Simulate realistic insurance data for automobile policies.
- Apply GLMs to model:
  - **Claim frequency** using Poisson and Negative Binomial models.
  - **Claim severity** using Gamma models.
- Evaluate model performance, dispersion, and influence.
- Visualize risk profiles and tariff differences.
- (Optional) Deploy an interactive **Shiny app** for pricing scenarios.

---

## Dataset Description

The dataset consists of **1,000 simulated automobile insurance policies**, including the following variables:

| Variable               | Type      | Description                                              |
|------------------------|-----------|----------------------------------------------------------|
| `age`                 | Numeric   | Age of the driver                                        |
| `vehicle_type`        | Factor    | Vehicle type ("Sedan", "SUV", "Truck")                   |
| `region`              | Factor    | Geographic zone ("North", "South", "East", "West")       |
| `claim_history`       | Integer   | Number of claims in the last 3 years                     |
| `exposure`            | Numeric   | Fraction of the year insured (between 0.1 and 1.0)        |
| `num_claims`          | Integer   | Number of reported claims (used in frequency models)     |
| `total_claim_amount`  | Numeric   | Total cost of claims in euros (used in severity models)  |

All variables were **simulated using R**, incorporating realistic assumptions about how risk factors (age, claim history, vehicle type, etc.) influence frequency and severity.

---

## Required Packages

```r
# Install and load these packages before running the scripts
packages <- c("tidyverse", "MASS", "car", "performance", "broom", "ggplot2", "shiny", "mgcv")
to_install <- packages[!(packages %in% installed.packages()[, "Package"])]
if(length(to_install)) install.packages(to_install)
invisible(lapply(packages, library, character.only = TRUE))
