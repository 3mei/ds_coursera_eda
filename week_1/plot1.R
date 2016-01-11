#load the data
my_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# get all the rows we care about
subset <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007"), ]

globalActivePower <- as.numeric(subset$Global_active_power)
# start the PNG device
png("plot1.png", width=480, height=480)
# plot the histogram
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
# turn off the device
dev.off()