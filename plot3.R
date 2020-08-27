setwd("/home/kris/Documents/R Programming/MyRScripts/Exp_Data_Anal/Week1 Project")
library("dplyr")
library(lubridate)
library(stringr)
###########################################
#read in huge table
#subset required dates
#write slimmed down table

daterange <- c("1/2/2007","2/2/2007")
powerall <- read.table("household_power_consumption.txt",
                    header = TRUE,sep = ";")
powerdates <- filter(powerall,Date %in% daterange)
write.table(powerdates, "./powerdates.txt", row.names = FALSE, quote = FALSE)
################################################

dataTable <- read.table("powerdates.txt", header = TRUE)
dataTable$datetime <- strptime(paste(dataTable$Date,dataTable$Time), "%d/%m/%Y %H:%M:%S")
dataTable$weekday <- wday(dataTable$datetime,label = TRUE)



png(file = "plot3.png",width = 480,height = 480,units = "px")

plot(dataTable$datetime,dataTable$Sub_metering_1,type = "l",xlab = "",
     ylab = "Energy sub metering")
points(dataTable$datetime,dataTable$Sub_metering_2,type = "l",col = "red")
points(dataTable$datetime,dataTable$Sub_metering_3,type = "l",col = "purple3")
legend("topright",lwd = 1, col = c("black","red","purple3"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


