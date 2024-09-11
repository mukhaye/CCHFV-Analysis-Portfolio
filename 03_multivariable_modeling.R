# 03_multivariable_modeling.R

# Load necessary libraries
library(lme4)
library(broom)

# Load cleaned data
hum <- read.csv("cleaned_human.csv", header = TRUE)
live <- read.csv ("cleaned_livestock.csv", header = TRUE)

#univariate logistic regression analyses for livestock
summary(glm(cchf~sex, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~sex, data=live, family = binomial(link="logit")))
summary(glm(cchf~age, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~age, data=live, family = binomial(link="logit")))
summary(glm(cchf~species, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~species, data=live, family = binomial(link="logit")))
summary(glm(cchf~ward, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~ward, data=live, family = binomial(link="logit")))
summary(glm(cchf~dem, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~dem, data=live, family = binomial(link="logit")))
summary(glm(cchf~arid, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~arid, data=live, family = binomial(link="logit")))
summary(glm(cchf~ndvi, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~ndvi, data=live, family = binomial(link="logit")))
summary(glm(cchf~lulc, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~lulc, data=live, family = binomial(link="logit")))
summary(glm(cchf~mrain, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~mrain, data=live, family = binomial(link="logit")))
summary(glm(cchf~slop, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~slop, data=live, family = binomial(link="logit")))
summary(glm(cchf~bio1, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~bio1, data=live, family = binomial(link="logit")))
summary(glm(cchf~bio3, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~bio3, data=live, family = binomial(link="logit")))
summary(glm(cchf~bio12, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~bio12, data=live, family = binomial(link="logit")))
summary(glm(cchf~vphmin, data=live, family = binomial(link="logit")))
tab_model(glm(cchf~vphmin, data=live, family = binomial(link="logit")))

#multivariable analysis for livestock
names(live)
summary(glm(cchf~age+ward+ele+ndvi+arid+bio3, data=live, family = binomial(link="logit")))

#mixed model for livestock
head(live)
live$id3<-substr(live$hhid2, 4,6)
live$herd<-as.numeric(live$id3)

summary(glmer(cchf~age+ndvi+arid+dem+(1|id3), data=live, family = binomial(link="logit")))
mod1<-glmer(cchf~age+vphmin+ndvi+(1|id3),
            data=live, family = binomial(link="logit"))

# Summarize the model
summary(mod1)
tab_model(mod1)

# Save model summary as a table
write.csv(tidy(model1), "model1_summary.csv")

#univariate logistic regression analyses for humans
#univariable analyses 
summary(glm(cchf~gender, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~gender, data=hum, family = binomial(link="logit")))
summary(glm(cchf~age_group, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~age_group, data=hum, family = binomial(link="logit")))
summary(glm(cchf~Ward, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~Ward, data=hum, family = binomial(link="logit")))
summary(glm(cchf~dem, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~dem, data=hum, family = binomial(link="logit")))
summary(glm(cchf~arid, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~arid, data=hum, family = binomial(link="logit")))
summary(glm(cchf~ndvi, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~ndvi, data=hum, family = binomial(link="logit")))
summary(glm(cchf~lulc, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~lulc, data=hum, family = binomial(link="logit")))
summary(glm(cchf~mrain, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~mrain, data=hum, family = binomial(link="logit")))
summary(glm(cchf~slop, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~slop, data=hum, family = binomial(link="logit")))
summary(glm(cchf~bio1, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~bio1, data=hum, family = binomial(link="logit")))
summary(glm(cchf~bio3, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~bio3, data=hum, family = binomial(link="logit")))
summary(glm(cchf~bio12, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~bio12, data=hum, family = binomial(link="logit")))
summary(glm(cchf~lprev1, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~lprev1, data=hum, family = binomial(link="logit")))
summary(glm(cchf~vphmin.x, data=hum, family = binomial(link="logit")))
tab_model(glm(cchf~vphmin.x, data=hum, family = binomial(link="logit")))

#multivariable analysis for humans
names(live)
summary(glm(cchf~gender+Ward+age_group+lprev1, data=hum, family = binomial(link="logit")))

#mixed model for humans
library(lmtest)
mod2<-glmer(cchf~+age_group+lprev + gender+(1|hh_id), 
            data=hum, family = binomial(link="logit"))
# Summarize the model 
summary(mod2)
tab_model(mod2)

# Save model summary as a table
write.csv(tidy(model1), "model1_summary.csv")
