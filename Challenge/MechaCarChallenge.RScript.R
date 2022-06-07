# Import dplyr package
library(dbplyr)

# Import and read in the MechaCar_mpg.csv file as a dataframe.
library(tidyverse)
mecha_car <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)


# Perform linear regression on the dataframe while passing on all six variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car)) 

# Import and read the suspension dataset as table
suspension_coil <- read.csv(file='Suspension_Coil.csv',check.names=F, stringsAsFactors = F) 

# Summary using summarize function
total_summary <- suspension_coil %>% summarize(Mean = mean(PSI),
                                         Median = median(PSI),
                                         Variance = var(PSI),
                                         SD = sd(PSI)) 

# group_by and summarize functions
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))


# t test function
t.test(x=suspension_coil$PSI, mu=1500)

subset_Lot1 <- subset(suspension_coil, suspension_coil$Manufacturing_Lot == 'Lot1')
t.test(x=subset_Lot1$PSI, mu=1500)

subset_Lot2 <- subset(suspension_coil, suspension_coil$Manufacturing_Lot == 'Lot2')
t.test(x=subset_Lot2$PSI, mu=1500)

subset_Lot3 <- subset(suspension_coil, suspension_coil$Manufacturing_Lot == 'Lot3')
t.test(x=subset_Lot3$PSI, mu=1500)
