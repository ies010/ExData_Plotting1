## Exploratory Data Analysis
## Course assginment 1 - Plot 3
## Igor Escobar

## Read in data, subset and format Date variable
fileName <- "./household_power_consumption.txt"
data <- read.csv(fileName, header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Creates Date+Time
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")
subSetData$Datetime <- as.POSIXct(paste(as.Date(subSetData$Date), subSetData$Time))

## -------------- Create Plot 3 ------------------------
#par(mai=c(1,2,1,1))
with(subSetData, {
    plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="", 
         col='black', cex=0.2)
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file 
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
