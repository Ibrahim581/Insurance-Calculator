# Load packages
library(tidyverse)

# The data set
insurance <- read.csv("insurance.csv")

# The model
insurance.model <- lm(charges ~ sex + bmi + children + smoker + region, data = insurance)
summary(insurance.model)

insurance$predicted.charges <- insurance.model$fitted.values

# Using the model predict insurance charges
# Example
predict(insurance.model, data.frame(sex = "male", bmi = 23.5, children = 2, smoker = "no", region = "northwest"))

# Creating a function using predict()
insurance.calculator <- function(sex, bmi, children, smoker, region){
  insurance.model <- lm(charges ~ sex + bmi + children + smoker + region, data = insurance)
  predict(insurance.model, data.frame(sex = sex, bmi = bmi, children = children, smoker = smoker, region = region))
  
  
}

insurance.calculator("female", 27.5, 2, "yes", "southwest")

insurance.calculator("male", 30, 3, "yes", "northwest")







