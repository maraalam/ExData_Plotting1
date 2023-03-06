library("data.table")

electricityDT <- data.table::fread(input="/kaggle/input/electric-power-consumption/household_power_consumption.txt",
                                  na.strings="?")
                                  
                                  
electricityDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]                                 

# Filter Dates for 2007-02-01 and 2007-02-02
electricityDT <- electricityDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

par(mfrow=c(2,2))

# Plot 1
plot(electricityDT[, dateTime], electricityDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(electricityDT[, dateTime],electricityDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(electricityDT[, dateTime], electricityDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(electricityDT[, dateTime], electricityDT[, Sub_metering_2], col="red")
lines(electricityDT[, dateTime], electricityDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1),
       bty="n",
       cex=.5) 

# Plot 4
plot(electricityDT[, dateTime], electricityDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")


png("plot4.png", width=400, height=400)

par(mfrow=c(2,2))

# Plot 1
plot(electricityDT[, dateTime], electricityDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(electricityDT[, dateTime],electricityDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(electricityDT[, dateTime], electricityDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(electricityDT[, dateTime], electricityDT[, Sub_metering_2], col="red")
lines(electricityDT[, dateTime], electricityDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1),
       bty="n",
       cex=.5) 

# Plot 4
plot(electricityDT[, dateTime], electricityDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
