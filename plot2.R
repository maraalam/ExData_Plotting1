library("data.table")

electricityDT <- data.table::fread(input="/kaggle/input/electric-power-consumption/household_power_consumption.txt",
                                  na.strings="?")


electricityDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
electricityDT <- electricityDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

plot(x = electricityDT[, dateTime], 
      y = electricityDT[, Global_active_power],
      type="l", xlab="", ylab="Global Active Power (kilowatts)")
     
     
png("plot2.png", width=400, height=400)

plot(x = electricityDT[, dateTime], 
      y = electricityDT[, Global_active_power],
      type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
