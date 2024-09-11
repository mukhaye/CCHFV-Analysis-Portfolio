# CCHFV-Analysis-Portfolio
### Author: Eugine Mukhaye

Welcome to my portfolio showcasing the analysis of Crimean Congo Hemorrhagic Fever Virus (CCHFV) exposure patterns and risk factors among humans, livestock, and wild animals in Isiolo County, Kenya. This repository includes the structured R scripts, data outputs, and key findings from the research.

## Overview

This analysis was conducted to understand the prevalence and associated risk factors of CCHFV in various host species at the human-livestock-wildlife interface. The study utilized a One Health approach, integrating environmental, animal, and human health data to assess the impact of the disease.

### Repository Structure

- **01_data_cleaning.R**: This script includes the code for data import, cleaning, and preprocessing for human, livestock, and wildlife datasets.
- **02_descriptive_analysis.R**: This script performs descriptive analyses, including summary statistics and visualizations of CCHFV prevalence by age, species, and ward.
- **03_multivariable_modeling.R**: This script contains the multivariable logistic regression and mixed-effects models to identify key risk factors associated with CCHFV exposure.
- **04_geospatial_analysis.R**: This script handles the extraction and analysis of geospatial data, mapping the distribution of CCHFV prevalence in the study area.

## Key Findings

- **High CCHFV Prevalence in Camels:** Camels showed the highest seroprevalence among livestock, suggesting they play a significant role in CCHFV transmission.
- **Age and Gender Associations:** Older age groups and males had higher odds of exposure in human subjects, highlighting potential occupational risk factors.
- **Environmental Influences:** Variables like NDVI and aridity were significantly associated with CCHFV prevalence in livestock, suggesting the importance of environmental conditions in disease dynamics.

## Visual Outputs

Here are some key visualizations generated from the analysis:

### CCHFV Prevalence by Age Group
![CCHFV Age Prevalence](cchf_age_prevalence.png)

### Geospatial Distribution of CCHFV Prevalence
![Geospatial Distribution](cchf_geospatial_distribution.png)

## How to Use This Repository

1. **Explore the R Scripts**: Each script is well-documented with comments to guide you through the analysis steps.
2. **Run the Analyses**: You can replicate the analyses by running the R scripts sequentially in your R environment.
3. **View Outputs**: Review the CSV files and plots to see the data-driven insights derived from the study.

## Contact

Feel free to reach out if you have any questions or would like to collaborate on similar projects:

- **Email**: [euginemukhaye17@gmail.com](mailto:euginemukhaye17@gmail.com)
- **Website**: [https://euginemukhaye.weebly.com/](https://euginemukhaye.weebly.com/)

## Acknowledgements

This work was conducted with the support of the International Livestock Research Institute (ILRI) and other collaborators listed in the original publication. Special thanks to all data collectors and participants in Isiolo County.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

