## Exploratory Data Analysis
## Course assginment 1 - Plot 2
## Igor Escobar

## Read in data, subset and format Date variable
fileName <- "./household_power_consumption.txt"
data <- read.csv(fileName, header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Creates Date+Time
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")
subSetData$Datetime <- as.POSIXct(paste(as.Date(subSetData$Date), subSetData$Time))

## -------------- Create Plot 2 ------------------------
plot(subSetData$Global_active_power~subSetData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

