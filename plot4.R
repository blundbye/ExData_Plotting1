## Remember to set working directory!


## Getting full dataset
dataFile <- "./Data/household_power_consumption.txt"

data_full <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?", 
                        check.names=FALSE, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#str(data_subset)


## Subsetting the data and remove full dataset
data_subset <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)


## Converting dates
dt <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(dt)


## Create plot 4
par(mfrow=c(2,2))
    ##, mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_subset, {
  plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power")
  
  plot(Datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(Datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(Datetime, Sub_metering_2, type="l", col="red")
  lines(Datetime, Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), lty=1, lwd=2, bty="n", col=c("black", "red", "blue"), cex=0.8)
  
  plot(Global_reactive_power~Datetime, type="l", xlab="datetime", ylab="Global_reactive_power")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()