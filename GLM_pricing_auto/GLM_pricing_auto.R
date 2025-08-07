# List of required packages
packages <- c(
  "tidyverse",     # Data manipulation and visualization
  "MASS",          # Negative Binomial models
  "mgcv",          # (Optional) Generalized Additive Models
  "car",           # Regression diagnostics (influence, collinearity)
  "performance",   # Model performance metrics
  "broom",         # Tidy model outputs
  "ggplot2",       # Visualization
  "shiny"          # (Optional) Interactive app         
)

to_install <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(to_install)) install.packages(to_install)

invisible(lapply(packages, library, character.only = TRUE))

# Load required packages
library(tidyverse)

# Set seed for reproducibility
set.seed(123)

# Number of policies
n <- 1000

# Simulate data
df <- tibble(
  age = round(runif(n, 18, 80)),  # Driver age from 18 to 80
  vehicle_type = sample(c("Sedan", "SUV", "Truck"), n, replace = TRUE, prob = c(0.5, 0.3, 0.2)),
  region = sample(c("North", "South", "East", "West"), n, replace = TRUE),
  claim_history = rpois(n, lambda = 0.5),
  exposure = runif(n, 0.1, 1.0)
)

# Frequency: simulate number of claims (Poisson, with exposure offset and age effect)
lambda <- exp(-3 + 0.02 * df$age + 0.4 * (df$vehicle_type == "Truck") + 
                0.3 * (df$region == "South") + 0.5 * df$claim_history) * df$exposure
df$num_claims <- rpois(n, lambda)

# Severity: simulate total claim cost only if there are claims
avg_cost <- exp(8 + 0.2 * (df$vehicle_type == "SUV") + 0.3 * df$claim_history)
severity <- rgamma(n, shape = 2, scale = avg_cost / 2)
df$total_claim_amount <- ifelse(df$num_claims > 0, severity, 0)

# Check
glimpse(df)