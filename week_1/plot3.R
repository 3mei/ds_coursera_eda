#load the data
my_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# get all the rows we care about
subset <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007"), ]

# get the time
time <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subset$Global_active_power)

subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)

# start the PNG device
png("plot3.png", width=480, height=480)
# plot, leave the x-axis blank
plot(time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(time, subMetering2, type="l", col="red")
lines(time, subMetering3, type="l", col="blue")
# include a legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
# turn off the device
dev.off()