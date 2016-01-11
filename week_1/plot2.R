#load the data
my_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# get all the rows we care about
subset <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007"), ]

# get the time
time <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subset$Global_active_power)
# start the PNG device
png("plot2.png", width=480, height=480)
# plot, leave the x-axis blank
plot(time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# turn off the device
dev.off()