library(dplyr)
library(ggplot2)
data <- read.table("household_power_consumption.txt",sep=";")

measurements <- filter(data,V1 == "1/2/2007" | V1 == "2/2/2007")

globalActivePower <- as.numeric(measurements$V3)
gAPinkW <- globalActivePower/1000
date <- measurements$V1
time <- measurements$V2

datetime <- as.POSIXct(paste(date,time),format="%d/%m/%Y %H:%M:%S")

png("plot2.png",width=480,height=480)

plot(datetime,gAPinkW,type="l",ylab="Global Active Power (kW)")
dev.off()
