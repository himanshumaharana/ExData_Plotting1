# read the data from the file
reqd_file <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

# subset the data from dates 1/2/2007 to 2/2/2007
reqd_data <- data[reqd_file$Date %in% c("1/2/2007","2/2/2007") ,]

# use strptime and paste to get the date and time in reqd formats
# save the data to x-axis
x_axis <- strptime(paste(reqd_data$Date, reqd_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# covert global active power to numeric and save to y-axis
y_axis <- as.numeric(reqd_data$Global_active_power)

# launch PNG graphic device
png("plot2.png", width=480, height=480)

# plot the graph
plot(x_axis, y_axis, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the graphics device
dev.off()


