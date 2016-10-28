## Read data into Table
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Create subset and Get data only for the dates 2007/02/01 and 2007/02/02
hpc_pl2 <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

# Format Data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(hpc_pl2$Global_active_power)

# PLot 2
# Creates graph of date/time vs global active power data
plot(datetime, globalactivepower, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")

## Copy plot2 to a PNG file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()