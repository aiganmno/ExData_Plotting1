## assumption: there is data file household_power_consumption.txt in the working directory
## reads whole file into memory, specifies separator, header flag and question mark for NA
## improvement pending - read only rows with Date column value matching the requirements
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

## subsetting: extract only rows with Date column matching the 2 dates required
data <- data[data["Date"] == "1/2/2007" | data["Date"] == "2/2/2007",]

## creates date objects using Date and Time columns and saves the values in Time column
data$Time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## start png graphics device with file name plot2.png, by default it will be 480x480 px as required
png("plot2.png")

## creates 2-D line plot showing Global_active_power changes in time (during 2 days)
## specifies X axis label, Y axis label, type (to draw line instead of points) as those parameters are different from default ones
plot(data$Time, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

## plot is complete, close PNG graphics device
dev.off()