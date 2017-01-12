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


## Create plot 2
plot(data_subset$Global_active_power~data_subset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to PNG file (with a width of 480 pixels and a height of 480 pixels)
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

