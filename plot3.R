
## script plot3.R
# Exploratory data analysis - Course Project 1
# plot Sub meterings over time

library(lubridate)
library(dplyr)

# load file and extract data
pc<-read.csv("data/household_power_consumption.txt",header=T, sep=";", nrows=69600,
             colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
pc$Date = as.Date(pc$Date,"%d/%m/%Y")
pc2<-filter(pc,pc$Date == "2007-02-01" | pc$Date == "2007-02-02")
pc2$DateTime<-strptime(paste(pc2$Date, pc2$Time),"%Y-%m-%d %H:%M:%S")


# do plotting in png plotting device

## PLOT 3
png(filename = "plot3.png",width = 480, height = 480, units = "px", pointsize = 12, bg = "gray98")

with(pc2, plot(DateTime,Sub_metering_1, type="n", ylab="Energy sub metering",xlab="Day"))
with(pc2, lines(DateTime,Sub_metering_1 ,col="black"))
with(pc2, lines(DateTime,Sub_metering_2 ,col="blue"))
with(pc2, lines(DateTime,Sub_metering_3 ,col="red"))
legend("topright", lty=1, col= c("black", "blue","red"), legend = names(pc2[,7:9])) #c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()