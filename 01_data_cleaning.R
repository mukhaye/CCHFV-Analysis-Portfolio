# 01_data_cleaning.R

# Load necessary libraries
library(janitor)
library(dplyr)
library(raster)

# Set working directory and load data
setwd("C:/Users/SA/Desktop/Msc/CCHFV/CCHFV R analyses")
live <- read.csv("new_livestock.csv", header = TRUE)
hum <- read.csv("human.csv", header = TRUE)
wild <- read.csv("wildlife.csv", header = TRUE)

# Data cleaning for livestock data
live <- live %>%
  clean_names() %>%
  filter(!is.na(cchf))  # Filter rows without CCHFV data

# Data cleaning for human data
hum <- hum %>%
  clean_names() %>%
  filter(!is.na(cchf))

# Export cleaned data
write.csv(live, "cleaned_livestock.csv")
write.csv(hum, "cleaned_human.csv")
