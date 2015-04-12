hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
hpc_use<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

png(file = "plot1.png", width = 480, height = 480)

hist(hpc_use$Global_active_power, col='Red', main='Global Active Power', xlab='Glbal Active Power (kilowatts)')

dev.off()