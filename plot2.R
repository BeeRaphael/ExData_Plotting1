
## script plot2.R
# Exploratory data analysis - Course Project 1
# plot Global Active Power over time

library(lubridate)
library(dplyr)

# load file and extract data
pc<-read.csv("data/household_power_consumption.txt",header=T, sep=";", nrows=69600,
             colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
pc$Date = as.Date(pc$Date,"%d/%m/%Y")
pc2<-filter(pc,pc$Date == "2007-02-01" | pc$Date == "2007-02-02")
DateTime<-strptime(paste(pc2$Date, pc2$Time),"%Y-%m-%d %H:%M:%S")

# do plotting in png plotting device
png(filename = "plot2.png",width = 480, height = 480, units = "px", pointsize = 12, bg = "snow")
plot(DateTime,pc2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="Day",col="black")
dev.off()