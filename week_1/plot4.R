#load the data
my_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# get all the rows we care about
subset <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007"), ]

# get the time
time <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# get the active/reactive power and voltage
globalActivePower <- as.numeric(subset$Global_active_power)
globalReactivePower <- as.numeric(subset$Global_reactive_power)
voltage <- as.numeric(subset$Voltage)

# get submetering
subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)

# start the PNG device
png("plot4.png", width=480, height=480)
# make a 2x2 plot
par(mfrow = c(2, 2)) 
# plot
plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(time, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(time, subMetering2, type="l", col="red")
lines(time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2, col=c("black", "red", "blue"), bty="o")
plot(time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# turn off the device
dev.off()