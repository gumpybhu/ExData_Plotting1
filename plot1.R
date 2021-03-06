vars <- c("character","character",rep("numeric",7))
data <- read.table("household_power_consumption.txt", h= 1,sep =";", colClasses = vars,na.strings="?")
dataToRead <- subset(data, (data$Date == "1/2/2007")|(data$Date == "2/2/2007"))
hist(dataToRead$Global_active_power,col = "red",main = "Global Active Power", xlab = "Global Active power (kilowats)")
dev.copy(png, file = "Plot1.png")
dev.off()
