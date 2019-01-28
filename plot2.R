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
png(filename="plot2.png",width=480,height=480,units="px")
plot(DataRed$DateTime,DataRed$Global_active_power, type="l",xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()