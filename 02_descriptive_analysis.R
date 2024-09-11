# 02_descriptive_analysis.R

# Load necessary libraries
library(dplyr)
library(janitor)
library(Hmisc)

# Load cleaned data
live <- read.csv("cleaned_livestock.csv", header = TRUE)
hum <- read.csv("cleaned_human.csv", header = TRUE)

# Descriptive analysis for livestock
age_summary <-live %>% 
  tabyl(age, cchf) %>%
  adorn_totals(where = "col")
chisq.test(age)
binconf(x=294, n=1553, alpha=.05) #adult
binconf(x=28, n=228, alpha=.05) #young adults
binconf(x=17, n=57, alpha=.05) #calves

sex_summary <-live %>% 
  tabyl(sex, cchf) %>%
  adorn_totals(where = "col")
chisq.test(sex)
binconf(x=52, n=410, alpha=.05) #male
binconf(x=227, n=1358, alpha=.05) #female

spp_summary<- live %>% 
  tabyl(species, cchf) %>%
  adorn_totals(where = "col")
chisq.test(spp)
binconf(x=100, n=160, alpha=.05) #cattle
binconf(x=87, n=97, alpha=.05) #camel
binconf(x=96, n=841, alpha=.05) #goats
binconf(x=66, n=750, alpha=.05) #sheep

ward_summary <-live %>% 
  tabyl(ward, cchf) %>%
  adorn_totals(where = "col")
binconf(x=134, n=511, alpha=.05) #sericho
binconf(x=98, n=932, alpha=.05) #garbatulla
binconf(x=47, n=325, alpha=.05) #kinna

# Export the descriptive table
write.csv(age_summary, "age_summary.csv")
write.csv(sex_summary, "sex_summary.csv")
write.csv(spp_summary, "spp_summary.csv")
write.csv(ward_summary, "ward_summary.csv")

# Plotting age vs CCHFV prevalence
library(ggplot2)
ggplot(live, aes(x = age, fill = cchf)) +
  geom_bar(position = "fill") +
  labs(title = "CCHFV Prevalence by Age Group", x = "Age Group", y = "Proportion") +
  theme_minimal()
#edit the code to plot the other variables including sex, spp and ward
# Save the plot
ggsave("cchf_age_prevalence.png")

#descriptive Analysis for humans
ag <-hum %>% 
  tabyl(age_group, cchf) %>%
  adorn_totals(where = "col")
binconf(x=1, n=58, alpha=.05) #2-14
binconf(x=5, n=177, alpha=.05) #15-29
binconf(x=15, n=143, alpha=.05) #30-44
binconf(x=21, n=202, alpha=.05) #45+
chisq.test(ag)

hum %>% 
  tabyl(gender, cchf) %>%
  adorn_totals(where = "col")
gen<-hum %>% 
  tabyl(gender, cchf) %>%
  adorn_totals(where = "col")
chisq.test(gen)
binconf(x=3, n=98, alpha=.05) #female
binconf(x=39, n=482, alpha=.05) #male

hum %>% 
  tabyl(Ward, cchf) %>%
  adorn_totals(where = "col")
chisq.test(hum)

ward<-hum %>% 
  tabyl(Ward, cchf) %>%
  adorn_totals(where = "col")
chisq.test(ward)
binconf(x=22, n=234, alpha=.05) #sericho
binconf(x=15, n=284, alpha=.05) #garbatulla
binconf(x=5, n=82, alpha=.05) #kinna

#descriptive Analysis for bioclimatic factors

live2<-na.omit(live)
live2 %>% group_by(cchf) %>% 
  summarise(mean1 = mean(ndvi),
            sd1 = sd(ndvi),
            mean2 = mean(slop),
            sd2 = sd(slop),
            mean3 = mean(mrain),
            sd3 = sd(mrain),
            mean4 = mean(lulc),
            sd4 = sd(lulc),
            mean5 = mean(arid),
            sd5 = sd(arid),
            mean6 = mean(bio1),
            sd6 = sd(bio1),
            mean7 = mean(bio3),
            sd7 = sd(bio3),
            mean8 = mean(bio12),
            sd8 = sd(bio12),
            mean9 = mean(vphmin),
            sd9 = sd(vphmin),
            na.rm=TRUE)

t.test(live$slop, live$cchf)
t.test(live$ndvi, live$cchf)
t.test(live$mrain, live$cchf)
t.test(live$lulc, live$cchf)
t.test(live$arid, live$cchf)
t.test(live$bio1, live$cchf)
t.test(live$bio3, live$cchf)
t.test(live$bio12, live$cchf)
t.test(live$dem, live$cchf)
t.test(live$vphmin, live$cchf)
