# 02_descriptive_analysis.R

# Load necessary libraries
library(dplyr)
library(janitor)

# Load cleaned data
live <- read.csv("cleaned_livestock.csv", header = TRUE)
hum <- read.csv("cleaned_human.csv", header = TRUE)

# Descriptive analysis for livestock
age_summary <- live %>%
  tabyl(age, cchf) %>%
  adorn_totals(where = "col")

# Export the descriptive table
write.csv(age_summary, "age_summary.csv")

# Plotting age vs CCHFV prevalence
library(ggplot2)
ggplot(live, aes(x = age, fill = cchf)) +
  geom_bar(position = "fill") +
  labs(title = "CCHFV Prevalence by Age Group", x = "Age Group", y = "Proportion") +
  theme_minimal()

# Save the plot
ggsave("cchf_age_prevalence.png")
