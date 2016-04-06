# read the data from the file
reqd_file <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

# subset the data from dates 1/2/2007 to 2/2/2007
reqd_data <- data[reqd_file$Date %in% c("1/2/2007","2/2/2007"),]

# use strptime and paste to get the date and time in reqd formats
# save the data to x-axis
x_axis <- strptime(paste(reqd_data$Date, reqd_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# covert Sub metering values to numeric and save to y-axis
y_axis1 <- as.numeric(reqd_data$Sub_metering_1)
y_axis2 <- as.numeric(reqd_data$Sub_metering_2)
y_axis3 <- as.numeric(reqd_data$Sub_metering_3)

# launch PNG graphic device
png("plot3.png", width=480, height=480)

# plot the graph
plot(x_axis, y_axis1, type="l", xlab="", ylab="Energy Submetering")
lines(x_axis, y_axis2, type="l", col="red")
lines(x_axis, y_axis3, type="l", col="blue")

# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# close the graphics device
dev.off()