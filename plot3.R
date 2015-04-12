hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpc_use<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]
hpc_use$DateTime<-strptime(paste(hpc_use$Date,hpc_use$Time),"%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480)

plot(hpc_use$DateTime,hpc_use$Sub_metering_1, xlab="", ylab='Energy sub metering', type="n")
points(hpc_use$DateTime, hpc_use$Sub_metering_1, col = "black" , type="l" )
points(hpc_use$DateTime, hpc_use$Sub_metering_2, col = "red" , type="l" )
points(hpc_use$DateTime, hpc_use$Sub_metering_3, col = "blue" , type="l" )
legend("topright", cex=.8, lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()