##first of all, pull the downloaded data
completedata <- read.table("./household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", check.names=F, stringsAsFactors=F, comment.char="", quote='\"', dec = ".")

#Convert date format
completedata$Date <- as.Date(completedata$Date, format="%d/%m/%Y")
#subsetting the required data only
completedata <- subset(completedata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

globalActivePower <- as.numeric(completedata$Global_active_power)
hist(globalActivePower, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()
