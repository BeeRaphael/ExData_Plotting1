## script plot1.R
# Exploratory data analysis - Course Project 1
# hist of Global Active Power


library(lubridate)
library(dplyr)

pc<-read.csv("data/household_power_consumption.txt",header=T, sep=";", nrows=69600,
             colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

pc$Date = as.Date(pc$Date,"%d/%m/%Y")
pc2<-filter(pc,pc$Date == "2007-02-01" | pc$Date == "2007-02-02")

## create a png device and plot in it
png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12, bg = "snow")
hist(pc2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off() 