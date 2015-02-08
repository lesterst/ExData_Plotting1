household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
house <- subset(household, (Date == "1/2/2007" | Date == "2/2/2007"))
house$datetime <- as.POSIXct(paste(house$Date,house$Time), format="%d/%m/%Y %H:%M:%S")


png(filename = "plot2.png",
    width = 480, height = 480)
plot(house$datetime, house$Global_active_power, type = "l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
