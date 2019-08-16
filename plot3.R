
data <- read.table("household_power_consumption.txt",sep=";")

measurements <- filter(data,V1 == "1/2/2007" | V1 == "2/2/2007")

subm1 <- as.numeric(measurements$V7)
subm2 <- as.numeric(measurements$V8)
subm3 <- as.numeric(measurements$V9)
date <- measurements$V1
time <- measurements$V2
datetime <- as.POSIXct(paste(date,time),format="%d/%m/%Y %H:%M:%S")

png("plot3.png",width=480,height=480)

plot(datetime,subm1,col="black",type="l",ylab="Energy sub metering")
lines(datetime,subm2,col="red")
lines(datetime,subm3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()
