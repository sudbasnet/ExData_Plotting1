##first of all, pull the downloaded data
completedata <- read.table("./household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", check.names=F, stringsAsFactors=F, comment.char="", quote='\"', dec = ".")
#Convert date format
completedata$Date <- as.Date(completedata$Date, format="%d/%m/%Y")
#subsetting the required data only
completedata <- subset(completedata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# numeric
globalActivePower <- as.numeric(completedata$Global_active_power)
voltage <- as.numeric(completedata$Voltage)
globalReactivePwr <- as.numeric(completedata$Global_reactive_power)
subMtr1 <- as.numeric(completedata$Sub_metering_1)
subMtr2 <- as.numeric(completedata$Sub_metering_2)
subMtr3 <- as.numeric(completedata$Sub_metering_3)
#POSIXct
datetime <- paste(as.Date(completedata$Date), completedata$Time)
completedata$Datetime <- as.POSIXct(datetime)

par(mfrow = c(2, 2), mar=c(4,4,2,1), oma=c(0,0,2,0))
# The Plot Quadrology:
# basically using the same principles as in Plots1-3
# Plot-4 Part1
plot(globalActivePower~Datetime, data = completedata, type="l", ylab="Global Active Power", xlab="")

# Plot-4 Part2
plot(voltage~Datetime, data = completedata, type="l", ylab="Voltage", xlab="datetime")

# Plot-4 Part3
plot(subMtr1~Datetime, data = completedata, type="l", ylab="Energy sub metering", xlab="")
lines(subMtr2~Datetime, data = completedata, type="l", col = "red")
lines(subMtr3~Datetime, data = completedata, type="l", col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1, lwd = 2, bty="n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot-4 Part4
plot(globalReactivePwr~Datetime, data = completedata, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()