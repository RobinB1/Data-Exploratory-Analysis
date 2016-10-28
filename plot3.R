## Read data into Table
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Create subset and Get data only for the dates 2007/02/01 and 2007/02/02
hpc_pl3 <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
  
datetime <- strptime(paste(hpc_pl3$Date, hpc_pl3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
SubMet1 <- as.numeric(hpc_pl3$Sub_metering_1)
SubMet2 <- as.numeric(hpc_pl3$Sub_metering_2)
SubMet3 <- as.numeric(hpc_pl3$Sub_metering_3)

# PLot 3
#Creates plot of date/time v Sub metering 1 data
plot(datetime, SubMet1, type = "l", xlab = "", ylab = "Energy sub metering")

#Adds line graph for date/time v Sub metering 2 data in red
lines(datetime, SubMet2, type = "l", col = "red" )

#Adds line graph for date/time v Sub metering 3 data in blue
lines(datetime, SubMet3, type = "l", col = "blue" )

#Adds legend to graph
legend("topright", lty= 1, lwd=2.5, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy plot3 to a PNG file
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()