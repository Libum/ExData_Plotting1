data = read.table("household_power_consumption.txt", sep=";", header = TRUE, dec = ".", na.strings = "?")
data = transform(data, DateTime = paste(data$Date, data$Time))
data$DateTime = strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
feb = subset(data, DateTime>="2007-02-01" & DateTime<"2007-02-03")
png(filename = "plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,4))
plot(feb$DateTime, feb$Global_active_power, type="l", ylab = "Global active power (kilowatts)", xlab="")
plot(feb$DateTime, feb$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
plot(feb$DateTime, feb$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
points(feb$DateTime, feb$Sub_metering_2, col="red", type = "l")
points(feb$DateTime, feb$Sub_metering_3, col="blue", type = "l")
legend("topright", pch = "-", col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(feb$DateTime, feb$Global_reactive_power, type = "l", xlab="datetime", ylab = "Global_reactive_power")
dev.off()