# This script reads the data from UC Irvine Machine Learning Repository, a dataset called Electrical Power consumption. The aim # of this project is to reproduce the 4 plots in the project. Plot 2 is the 2nd plot to be reproduced.

epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
epc$datetime <- paste(epc$Date,epc$Time)
epc$Date <- strptime(epc$Date, "%d/%m/%Y")
epc.sub <-subset(epc, Date == "2007-02-01" | Date == "2007-02-02")
epc.sub$datetime <- strptime(epc.sub$datetime, "%d/%m/%Y %H:%M:%S")

epc.sub$Global_active_power <- as.numeric(as.character(epc.sub$Global_active_power))
epc.sub$Global_reactive_power <- as.numeric(as.character(epc.sub$Global_reactive_power))
epc.sub$Voltage <- as.numeric(as.character(epc.sub$Voltage))
epc.sub$Global_intensity <- as.numeric(as.character(epc.sub$Global_intensity))
epc.sub$Sub_metering_1 <- as.numeric(as.character(epc.sub$Sub_metering_1))
epc.sub$Sub_metering_2 <- as.numeric(as.character(epc.sub$Sub_metering_2))
epc.sub$Sub_metering_3 <- as.numeric(as.character(epc.sub$Sub_metering_3))
str(epc.sub)

#Plot 2
par(mfrow=c(1,1),mar=c(4,4,2,1),oma=c(0,0,2,0))
plot(epc.sub$datetime,epc.sub$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="Plot 2.png", width=480, height=480)
dev.off()