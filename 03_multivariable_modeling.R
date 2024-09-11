# 03_multivariable_modeling.R

# Load necessary libraries
library(lme4)
library(broom)

# Load cleaned data
hum <- read.csv("cleaned_human.csv", header = TRUE)

# Logistic regression analysis
model1 <- glm(cchf ~ age + gender + ward, data = hum, family = binomial(link = "logit"))

# Summarize the model
model_summary <- summary(model1)
print(model_summary)

# Save model summary as a table
write.csv(tidy(model1), "model1_summary.csv")
