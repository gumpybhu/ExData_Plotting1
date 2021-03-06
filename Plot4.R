vars <- c("character","character",rep("numeric",7))
data <- read.table("household_power_consumption.txt", h= 1,sep =";", colClasses = vars,na.strings="?")
dataToRead <- subset(data, (data$Date == "1/2/2007")|(data$Date == "2/2/2007"))
abc <- as.POSIXct(paste(dataToRead$Date,dataToRead$Time), format = "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
plot(abc, dataToRead$Global_active_power, type= "l", ylab = "Global Active Power", xlab = "")
plot(abc, dataToRead$Voltage, type= "l", ylab = "Voltage", xlab = "datetime")
plot(abc, dataToRead$Sub_metering_1, type= "l", ylab = "Energy sub metering", xlab = "")
points(abc, dataToRead$Sub_metering_2, col = "red",type = "l")
points(abc, dataToRead$Sub_metering_3, col = "blue",type = "l")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)
plot(abc, dataToRead$Global_reactive_power, type= "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.copy(png, file = "Plot4.png")
dev.off()