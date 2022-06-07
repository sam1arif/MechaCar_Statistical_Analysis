# Import dplyr package
library(dbplyr)

# Import and read in the MechaCar_mpg.csv file as a dataframe.
library(tidyverse)
mecha_car <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)


# Perform linear regression on the dataframe while passing on all six variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car)) 
