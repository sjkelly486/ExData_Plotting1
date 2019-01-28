setwd("~/Career/DataScience/Courses/JohnsHopkins_DataScience/Courses/4_Exploratory_Data_Analysis/Week1_Project/ExData_Plotting1")
library(lubridate)


#Read in Data
data <- read.csv("household_power_consumption.txt", na.strings = "?",sep = ";", stringsAsFactors = FALSE)

#Convert Date and Time
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)



#Reduce data to only 2007-02-01 and 2007-02-02
DataRed <- data[data$Date==as.Date("01/02/2007",format="%d/%m/%Y") | data$Date==as.Date("02/02/2007",format="%d/%m/%Y"),]
DateTime <- DataRed$Date + DataRed$Time
DataRed <- cbind(DateTime,DataRed)


#Generate Plot#1 - Histogram of Global Active Power
png(filename="plot4.png",width=480,height=480,units="px")
par(mfrow = c(2,2))

with(DataRed, {
  #TOPLEFT
  plot(DateTime,Global_active_power, type="l",xlab="", ylab = "Global Active Power")
  
  #TOPRIGHT
  plot(DateTime,Voltage, type="l",xlab="datetime", ylab = "Voltage")
  
  #BOTTOMLEFT
  plot(DataRed$DateTime,DataRed$Sub_metering_1, type="l",xlab="", ylab = "Energy sub metering")
  lines(DataRed$DateTime,DataRed$Sub_metering_2,col="red")
  lines(DataRed$DateTime,DataRed$Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"), lty=1,legend = names(DataRed[8:10]),bty="n")
  
  #BOTTOMRIGHT
  plot(DateTime,Global_reactive_power, type="l",xlab="datetime", ylab = "Global_reactive_power")
})



dev.off()