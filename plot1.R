setwd("~/Career/DataScience/Courses/JohnsHopkins_DataScience/Courses/4_Exploratory_Data_Analysis/Week1_Project/ExData_Plotting1")
library(lubridate)


#Read in Data
data <- read.csv("household_power_consumption.txt", na.strings = "?",sep = ";", stringsAsFactors = FALSE)

#Convert Date and Time
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

#Reduce data to only 2007-02-01 and 2007-02-02
DataRed <- data[data$Date==as.Date("01/02/2007",format="%d/%m/%Y") | data$Date==as.Date("02/02/2007",format="%d/%m/%Y"),]



#Generate Plot#1 - Histogram of Global Active Power
png(filename="plot1.png",width=480,height=480,units="px")
hist(DataRed$Global_active_power, breaks=12, main="Global Active Power",xlab = "Global Active Power (kilowatts)", ylab="Frequency",col="red",xlim=c(0,6),ylim=c(0,1200))
dev.off()