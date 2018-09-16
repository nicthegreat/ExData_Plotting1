# This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for 
# machine learning datasets. In particular, we will be using the "Individual household electric power 
# consumption Data Set" which I have made available on the course web site:

# Dataset: Electric power consumption [20Mb]
# Description: Measurements of electric power consumption in one household with a one-minute sampling 
# rate over a period of almost 4 years. Different electrical quantities and some sub-metering values 
# are available.

hpc <- read.table('household_power_consumption.txt', header = T, sep = ';')
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

subset_data <- hpc[which(hpc$Date == '2007-02-01' | hpc$Date == '2007-02-02'),]

subset_data$Global_active_power <- as.numeric(as.character(subset_data$Global_active_power))
subset_data$Global_reactive_power <- as.numeric(as.character(subset_data$Global_reactive_power))
subset_data$Voltage <- as.numeric(as.character(subset_data$Voltage))
subset_data$Sub_metering_1 <- as.numeric(as.character(subset_data$Sub_metering_1))
subset_data$Sub_metering_2 <- as.numeric(as.character(subset_data$Sub_metering_2))

# PLOT 1
hist(subset_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# PLOT 2
subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
plot(subset_data$datetime, subset_data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

# PLOT 3
plot(subset_data$datetime, subset_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subset_data$datetime, subset_data$Sub_metering_2, col='red')
lines(subset_data$datetime, subset_data$Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# PLOT 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(subset_data$datetime, subset_data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
plot(subset_data$datetime, subset_data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(subset_data$datetime, subset_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subset_data$datetime, subset_data$Sub_metering_2, col='red')
lines(subset_data$datetime, subset_data$Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex = 0.7, col=c("black", "red", "blue"))
plot(subset_data$datetime, subset_data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")