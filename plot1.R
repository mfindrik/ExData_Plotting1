
library(dplyr)
data <- read.table("household_power_consumption.txt",sep=";")

measurements <- filter(data,V1 == "1/2/2007" | V1 == "2/2/2007")

globalActivePower <- as.numeric(measurements$V3)
gAPinkW <- globalActivePower/1000

png("plot1.png",width=480,height=480)

hist(gAPinkW,col="red",xlim=range(0,6),xlab="Global Active Power (kW)",main="Global Active Power")
dev.off()