#Select dplyr library
library(dplyr)
#Read in MechaCar data
M_car <- read.csv('data/MechaCar_mpg.csv')
#Perform linear regression
lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length,data=M_car)
#Summarize the linear regression
summary(lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length,data=M_car))


#plot for spoiler_angle
model <- lm(mpg ~ spoiler_angle,M_car) #create linear model
yvals <- model$coefficients['spoiler_angle']*M_car$spoiler_angle +
model$coefficients['(Intercept)'] #determine y-axis values from linear model

plt <- ggplot(M_car,aes(x=spoiler_angle,y=mpg)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model


#plot for vehicle_length
model <- lm(mpg ~ vehicle_length,M_car) #create linear model
yvals <- model$coefficients['vehicle_length']*M_car$vehicle_length +
model$coefficients['(Intercept)'] #determine y-axis values from linear model

plt <- ggplot(M_car,aes(x=vehicle_length,y=mpg)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model



#Read in Suspension_Coil data
Sus_Coil <- read.csv('data/Suspension_Coil.csv')
Sus_Coil

#Create a total summary for the PSI column in the dataframe
total_summary <- Sus_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
total_summary

#Create a grouping summary for the PSI in each Lot 
lot_summary <- Sus_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
lot_summary

total_lots = Sus_Coil['PSI']
t.test(total_lots[['PSI']], mu=1500) #T-test for all lots against mean of 1500 PSI

lot1 = subset(Sus_Coil, Manufacturing_Lot == 'Lot1')
t.test(lot1[['PSI']], mu=1500) #T-test for Lot1 against mean of 1500 PSI

lot2 = subset(Sus_Coil, Manufacturing_Lot == 'Lot2')
t.test(lot2[['PSI']], mu=1500) #T-test for Lot2 against mean of 1500 PSI

lot3 = subset(Sus_Coil, Manufacturing_Lot == 'Lot3')
t.test(lot3[['PSI']], mu=1500) #T-test for Lot3 against mean of 1500 PSI
