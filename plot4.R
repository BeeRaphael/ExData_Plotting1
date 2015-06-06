
## script plot4.R
# Exploratory data analysis - Course Project 1
# make 4 subplots: 
#           hist of Global Active Power
#           plot Voltage over time
#           plot Sub meterings over time
#           plot Global reactive power over time

library(lubridate)
library(dplyr)

# load file and extract data
pc<-read.csv("data/household_power_consumption.txt",header=T, sep=";", nrows=69600,
             colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
pc$Date = as.Date(pc$Date,"%d/%m/%Y")
pc2<-filter(pc,pc$Date == "2007-02-01" | pc$Date == "2007-02-02")
pc2$DateTime<-strptime(paste(pc2$Date, pc2$Time),"%Y-%m-%d %H:%M:%S")


# do plotting in png plotting device
png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(pc2, {
      plot(DateTime,Global_active_power, type="l", ylab="Global Active Power (kW)",col="black",xlab="Day")
      plot(DateTime,Voltage, type="l", ylab="Voltage",col="black",xlab="Day")
      
      plot(DateTime,Sub_metering_1, type="n", ylab="Energy sub metering",xlab="Day")
      lines(DateTime,Sub_metering_1 ,col="black")
      lines(DateTime,Sub_metering_2 ,col="blue")
      lines(DateTime,Sub_metering_3 ,col="red")
      legend("topright", lty=1, col= c("black", "blue","red"), legend = names(pc2[,7:9])) #c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
      
      plot(DateTime,Global_reactive_power, type="l", ylab="Global reactive power",col="black",xlab="Day") 
      
      mtext("Power Usage Data", outer = TRUE)
})

dev.off()