setwd("C:/Users/Matthew/Desktop/Inbox/R/Assignment1")
library(data.table)
library(lubridate)
library(dplyr)
library(datasets)

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
data1 <- filter(data, Date %in% c("1/2/2007","2/2/2007")) #Uses Dplyr
#Either Way Works
#data2 <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),] #Uses base#
datetime <- paste(data1$Date, data1$Time)
datetime1 <- strptime(datetime, format=" %d/%m/%Y %H:%M:%S")

datetime2 <- as.POSIXct(datetime1) #May need to check this#
data2 <- mutate(data1, Date = datetime2)
data2 <- select(data2, -Time)

"Plot 1"
hist(data2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="Plot1.png")
dev.off()