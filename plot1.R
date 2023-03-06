library("data.table")

electricityDT <- data.table::fread(input="/kaggle/input/electric-power-consumption/household_power_consumption.txt", na.strings="?")

head(electricityDT)

# Converting date column to type 'date'
electricityDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols=c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
electricityDT <- electricityDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

hist(electricityDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
     
     
# save hist as png file
png("/kaggle/working/plot1.png", width=400, height=400)

hist(electricityDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
