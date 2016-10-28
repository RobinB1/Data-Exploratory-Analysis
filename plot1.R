## Read data into Table
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## Format Date/Time
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## Create subset and Get data only for the dates 2007/02/01 and 2007/02/02
hpc_pl1 <- subset(hpc, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))

globalactivepower <- as.numeric(hpc_pl1$Global_active_power)

## Plot 1 - plot data 
hist(globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Copy plot1 to a PNG file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()