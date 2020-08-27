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

png(file = "plot1.png",width = 480,height = 480,units = "px")
hist(dataTable$Global_active_power,col = "red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()


