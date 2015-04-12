hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpc_use<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]
hpc_use$DateTime<-strptime(paste(hpc_use$Date,hpc_use$Time),"%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)

plot(hpc_use$DateTime, hpc_use$Global_active_power, xlab='', ylab='Glbal Active Power (kilowatts)', type="l")

dev.off()