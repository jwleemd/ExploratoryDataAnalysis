data <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F)

# Converting character vectors for date and time to Date and Time classes

data$Time <- paste(data$Date, data$Time)
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y"))
data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S")

# Subsetting data (for 2007-02-01 and 2007-02-02)

data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# plot 1

hist(as.numeric(data$Global_active_power), 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

# plot 2

plot(data$Time, as.numeric(data$Global_active_power), type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# plot 3

plot(data$Time, as.numeric(data$Sub_metering_1), type="l", col="black",
     xlab="",
     ylab="Energy sub metering")
lines(data$Time, as.numeric(data$Sub_metering_2), col="red")
lines(data$Time, as.numeric(data$Sub_metering_3), col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"), lty=1, lwd=1)

# plot 4

par(mfrow=c(2,2))

# 4-1

plot(data$Time, as.numeric(data$Global_active_power), type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# 4-2

plot(data$Time, as.numeric(data$Voltage), type="l",
     xlab="datatime",
     ylab="Voltage")

# 4-3

plot(data$Time, as.numeric(data$Sub_metering_1), type="l", col="black",
     xlab="",
     ylab="Energy sub metering")
lines(data$Time, as.numeric(data$Sub_metering_2), col="red")
lines(data$Time, as.numeric(data$Sub_metering_3), col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"), lty=1, lwd=1, cex=.75)

# 4-4

plot(data$Time, as.numeric(data$Global_reactive_power), type="l",
     xlab="datetime",
     ylab="Global_reactive_power")