## Read data into Table
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Create subset and Get data only for the dates 2007/02/01 and 2007/02/02
hpc_pl4 <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

# Format Data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(hpc_pl4$Global_active_power)
globalReactivePower <- as.numeric(hpc_pl4$Global_reactive_power)
voltage <- as.numeric(hpc_pl4$Voltage)
SubMet1 <- as.numeric(hpc_pl4$Sub_metering_1)
SubMet2 <- as.numeric(hpc_pl4$Sub_metering_2)
SubMet3 <- as.numeric(hpc_pl4$Sub_metering_3)
 
# Create Plot 4
#Sets graphing parameters so that 4 graphs are drawn by column
par(mfrow = c(2,2))

# Creates graph of date/time vs global active power data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

# Creates graph of date/time vs Voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Creates plot of date/time v Sub metering 1 data
plot(datetime, SubMet1, type = "l", xlab = "", ylab = "Energy sub metering")

#Adds line graph for date/time v Sub metering 2 data in red
lines(datetime, SubMet2, type = "l", col = "red" )

#Adds line graph for date/time v Sub metering 3 data in blue
lines(datetime, SubMet3, type = "l", col = "blue" )

#Adds legend to graph
legend("topright", lty= 1, lwd=2.5, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
     
## Copy plot4 to a PNG file
dev.copy(png, file = "plot4.png")
dev.off()