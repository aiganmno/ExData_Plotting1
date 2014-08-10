## assumption: there is data file household_power_consumption.txt in the working directory
## reads whole file into memory, specifies separator, header flag and question mark for NA
## improvement pending - read only rows with Date column value matching the requirements
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

## subsetting: extract only rows with Date column matching the 2 dates required
data <- data[data["Date"] == "1/2/2007" | data["Date"] == "2/2/2007",]

## creates date objects using Date and Time columns and saves the values in Time column
data$Time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## start png graphics device with file name plot4.png, by default it will be 480x480 px as required
png("plot4.png")

## set parameter in order to be able create 4 plots in 2 rows, 2 plots in each row
par(mfrow = c(2, 2))

## using only one dataset - data - for all 4 plots
with (data, {
    
    ## 1st plot in the 1st row: 
    ## 2-D line plot showing Sub_metering_1 changes in time (during 2 days)
    plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    
    ## 2nd plot in the 1st row:
    ## 2-D line plot showing Voltage changes in time (during 2 days)
    plot(Time, Voltage, type="l", xlab="datetime")
    
    ## 1st plot in the 2nd row:
    ## 2-D line plots showing all 3 sub metering changes in time (during 2 days)
    ## using different line colors for each sub metering and adding legend without box around it (bty="n")
    plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(Time, Sub_metering_2, type="l", col="red")
    lines(Time, Sub_metering_3, type="l", col="blue")
    legend("topright", bty="n", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## 2nd plot in the 2nd row:
    ## 2-D line plot showing Global_reactive_power changes in time (during 2 days)
    ## specifies only type - line plot and X axis label, other parameters default values satisfy requirements
    plot(Time, Global_reactive_power, type="l", xlab="datetime")
})

## whole plot is complete, close PNG graphics device
dev.off()