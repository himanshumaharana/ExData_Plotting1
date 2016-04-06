# read the data from the file
reqd_file <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

# subset the data from dates 1/2/2007 to 2/2/2007
reqd_data <- data[reqd_file$Date %in% c("1/2/2007","2/2/2007") ,]

# covert global active power to numeric and save to y-axis
x_axis <- as.numeric(reqd_data$Global_active_power)

# launch PNG graphic device
png("plot1.png", width=480, height=480)

# plot the graph
hist(x_axis, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close the graphics device
dev.off()


