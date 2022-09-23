#Select dplyr library
library(dplyr)
#Read in MechaCar data
M_car <- read.csv('data/MechaCar_mpg.csv')
#Perform linear regression
lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=M_car)
#Summarize the linear regression
summary(lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=M_car))