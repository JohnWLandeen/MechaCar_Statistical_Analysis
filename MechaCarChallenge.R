#Select dplyr library
library(dplyr)
#Read in MechaCar data
M_car <- read.csv('data/MechaCar_mpg.csv')
#Perform linear regression
lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length,data=M_car)
#Summarize the linear regression
summary(lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length,data=M_car))