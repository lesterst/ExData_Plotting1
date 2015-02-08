household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                        na.strings = "?", stringsAsFactors = FALSE)
house <- subset(household, (Date == "1/2/2007" | Date == "2/2/2007"))

png(filename = "plot1.png",
    width = 480, height = 480)
hist(house$Global_active_power, breaks = 12,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()
