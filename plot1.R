## Exploratory Data Analysis
## Course assginment 1 - Plot 1
## Igor Escobar

## Read in data, subset and format Date variable
fileName <- "./household_power_consumption.txt"
data <- read.csv(fileName, header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## -------------- Create Plot 1 ------------------------
hist(subSetData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
