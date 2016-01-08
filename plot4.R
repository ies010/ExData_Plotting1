## Exploratory Data Analysis
## Course assginment 1 - Plot 4
## Igor Escobar

## Read in data, subset and format Date variable
fileName <- "./household_power_consumption.txt"
data <- read.csv(fileName, header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Creates Date+Time
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")
subSetData$Datetime <- as.POSIXct(paste(as.Date(subSetData$Date), subSetData$Time))

## -------------- Create Plot 4 ------------------------
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) #, cex=0.75)
with(subSetData, {
    plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="", col='black')
    lines(Sub_metering_2~Datetime, col='Red')
    lines(Sub_metering_3~Datetime, col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=c(1,1), bty="n", cex=.75,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", ylab="Global_rective_power",xlab="datetime")
})

## Saving to file 
dev.copy(png, file="plot4.png", height=480, width=480, units = "px", pointsize = 10)
dev.off()
