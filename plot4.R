hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpc_use<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]
hpc_use$DateTime<-strptime(paste(hpc_use$Date,hpc_use$Time),"%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), cex = 0.8, mar = c(4,4,2,2) )

plot(hpc_use$DateTime, hpc_use$Global_active_power, cex = .2, xlab='', ylab='Glbal Active Power', type="l")

plot(hpc_use$DateTime, hpc_use$Voltage, xlab='datetime', ylab='Voltage', type="l")

plot(hpc_use$DateTime,hpc_use$Sub_metering_1, xlab='', ylab='Energy sub metering', type="n")
points(hpc_use$DateTime, hpc_use$Sub_metering_1, col = "black" , type="l" )
points(hpc_use$DateTime, hpc_use$Sub_metering_2, col = "red" , type="l" )
points(hpc_use$DateTime, hpc_use$Sub_metering_3, col = "blue" , type="l" )
legend("topright", cex = .9, lty=1,  bty="n", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(hpc_use$DateTime, hpc_use$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type="l")

dev.off()