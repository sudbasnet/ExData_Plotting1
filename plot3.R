##first of all, pull the downloaded data
completedata <- read.table("./household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", check.names=F, stringsAsFactors=F, comment.char="", quote='\"', dec = ".")

#Convert date format
completedata$Date <- as.Date(completedata$Date, format="%d/%m/%Y")
#subsetting the required data only
completedata <- subset(completedata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert Global_active_power to numeric
globalActivePower <- as.numeric(completedata$Global_active_power)

subMtr1 <- as.numeric(completedata$Sub_metering_1)
subMtr2 <- as.numeric(completedata$Sub_metering_2)
subMtr3 <- as.numeric(completedata$Sub_metering_3)
datetime <- paste(as.Date(completedata$Date), completedata$Time)
completedata$Datetime <- as.POSIXct(datetime)
plot(subMtr1~Datetime, data = completedata, type="l", ylab="Energy sub metering", xlab="")
lines(subMtr2~Datetime, data = completedata, type="l", col = "red")
lines(subMtr3~Datetime, data = completedata, type="l", col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()