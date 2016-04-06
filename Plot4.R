# read the data from the file
reqd_file <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

# subset the data from dates 1/2/2007 to 2/2/2007
reqd_data <- data[reqd_file$Date %in% c("1/2/2007","2/2/2007") ,]

# use strptime and paste to get the date and time in reqd formats
# save the data to x-axis
x_axis <- strptime(paste(reqd_data$Date, reqd_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# read and covert to numeric and save to different y-axis variables
# read global active power values
y1_axis1 <- as.numeric(reqd_data$Global_active_power)

# read submetering values
y2_axis1 <- as.numeric(reqd_data$Sub_metering_1)
y2_axis2 <- as.numeric(reqd_data$Sub_metering_2)
y2_axis3 <- as.numeric(reqd_data$Sub_metering_3)

# read voltage values
y3_axis1 <- as.numeric(reqd_data$Voltage)

# read global reactive power values
y4_axis1 <- as.numeric(reqd_data$Global_reactive_power)

# launch PNG graphic device
png("plot4.png", width=480, height=480)

# set graphing parameters so that 4 graphs can be drawn by column
par(mfcol = c(2,2))

# plot the graphs
plot(x_axis, y1_axis1, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(x_axis, y2_axis1, type="l", xlab="", ylab="Energy Submetering")
lines(x_axis, y2_axis2, type="l", col="red")
lines(x_axis, y2_axis3, type="l", col="blue")

# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#plot next two plots
plot(x_axis, y3_axis1, type="l", xlab="datetime", ylab="Voltage")

plot(x_axis, y_axis, type="l", xlab="datetime", ylab="Global_reactive_power (kilowatts)")

# close the graphics device
dev.off()