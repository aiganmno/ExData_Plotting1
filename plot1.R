## assumption: there is data file household_power_consumption.txt in the working directory
## reads whole file into memory, specifies separator, header flag and question mark for NA
## improvement pending - read only rows with Date column value matching the requirements
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

## subsetting: extract only rows with Date column matching the 2 dates required
data <- data[data["Date"] == "1/2/2007" | data["Date"] == "2/2/2007",]

## start png graphics device with file name plot1.png, by default it will be 480x480 px as required
png("plot1.png")

## plots histogram of column Global_active_power, specifies bar fill color - red, 
## title, X axis label as those parameters are different from default ones 
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## plot is complete, close PNG graphics device
dev.off()