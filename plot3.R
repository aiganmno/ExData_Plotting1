## assumption: there is data file household_power_consumption.txt in the working directory
## reads whole file into memory, specifies separator, header flag and question mark for NA
## improvement pending - read only rows with Date column value matching the requirements
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

## subsetting: extract only rows with Date column matching the 2 dates required
data <- data[data["Date"] == "1/2/2007" | data["Date"] == "2/2/2007",]

## creates date objects using Date and Time columns and saves the values in Time column
data$Time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## start png graphics device with file name plot3.png, by default it will be 480x480 px as required
png("plot3.png")

## creates 2-D line plot showing Sub_metering_1 changes in time (during 2 days)
## specifies X axis label, Y axis label, type (to draw line instead of points) as those parameters are different from default ones
plot(data$Time, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")

## adds another 2-D line plot to the existing one showing Sub_metering_2 changes in time (during 2 days)
## specifies type (to draw line instead of points) and line color - red, not to match Sub_metering_1 line plot
lines(data$Time, data$Sub_metering_2, type="l", col="red")

## adds another 2-D line plot to the existing one showing Sub_metering_3 changes in time (during 2 days)
## specifies type (to draw line instead of points) and line color - blue, not to match previously created line plots
lines(data$Time, data$Sub_metering_3, type="l", col="blue")

## adds legend to the top right corner
## specifies symbol - line (lty), line colors, 3 legend names for all 3 sub meterings
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot is complete, close PNG graphics device
dev.off()