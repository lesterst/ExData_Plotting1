household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                        na.strings = "?", stringsAsFactors = FALSE)
house <- subset(household, (Date == "1/2/2007" | Date == "2/2/2007"))
house$datetime <- as.POSIXct(paste(house$Date,house$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png",
    width = 480, height = 480)

par(mfcol = c(2,2))

plot(house$datetime, house$Global_active_power, type = "l",
     xlab="", ylab="Global Active Power (kilowatts)")

plot(house$datetime, house$Sub_metering_1, type = "l",
     xlab="", ylab="Energy sub metering")
lines(house$datetime, house$Sub_metering_2, type = "l", col = "red")
lines(house$datetime, house$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col = c("black", "red", "blue"), bty = "n")

plot(house$datetime, house$Voltage, type = "l",
     xlab="datetime", ylab="Voltage")

plot(house$datetime, house$Global_reactive_power, type = "l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
