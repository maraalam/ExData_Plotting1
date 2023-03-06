library("data.table")

electricityDT <- data.table::fread(input="/kaggle/input/electric-power-consumption/household_power_consumption.txt", na.strings="?")
                                  
                                  
# Making a POSIXct date capable of being filtered and graphed by time of day
electricityDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]      


# Filter Dates for 2007-02-01 and 2007-02-02
electricityDT <- electricityDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


plot(electricityDT[, dateTime], electricityDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(electricityDT[, dateTime], electricityDT[, Sub_metering_2],col="red")
lines(electricityDT[, dateTime], electricityDT[, Sub_metering_3],col="blue")
legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))
       
png("plot3.png", width=400, height=400)

plot(electricityDT[, dateTime], electricityDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(electricityDT[, dateTime], electricityDT[, Sub_metering_2],col="red")
lines(electricityDT[, dateTime], electricityDT[, Sub_metering_3],col="blue")
legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))


dev.off()       
