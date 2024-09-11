# 04_geospatial_analysis.R

# Load necessary libraries
library(raster)
library(ggplot2)

# Load GIS data and extract relevant features
arid <- raster("path/to/aridity_data.tif")
coords <- data.frame(long = live$long, lat = live$lat)

# Extract aridity values
arid_data <- data.frame(arid = extract(arid, coords))

# Plotting the geospatial data
ggplot(coords, aes(x = long, y = lat)) +
  geom_point(aes(color = arid_data$arid), size = 2) +
  labs(title = "Geospatial Distribution of CCHFV Prevalence", x = "Longitude", y = "Latitude") +
  theme_minimal()

# Save the plot
ggsave("cchf_geospatial_distribution.png")
