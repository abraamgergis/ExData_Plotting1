#Introduction + Loading and Preparing the data:

#Refer to Plot1 code
setwd("~/Exploratory Data Analysis")

colNames <- names(read.table("~/Exploratory Data Analysis/household_power_consumption.txt", 
                             nrow=1, header=TRUE, sep=";"))

pwercon <- read.table("~/Exploratory Data Analysis/household_power_consumption.txt", 
              na.strings = "?", skip = grep("^[1,2]/2/2007", 
              readLines("~/Exploratory Data Analysis/household_power_consumption.txt"))-1, nrow = 2879, 
              sep = ";", header = FALSE, col.names = colNames)

pwercon$datetime <- strptime(paste(pwercon$Date, pwercon$Time), "%Y-%m-%d %H:%M:%S")

pwercon$datetime <- as.POSIXct(pwercon$datetime)

# Plotting data:

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(pwercon$Global_active_power ~ pwercon$datetime, type = "l", ylab = "Global Active Power", xlab = "")

plot(pwercon$Voltage ~ pwercon$datetime, type = "l", ylab = "Voltage", xlab = datetime)

plot(x= pwercon$datetime, y = pwercon$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(pwercon$Sub_metering_2 ~ pwercon$datetime, col = "Red")
lines(pwercon$Sub_metering_3 ~ pwercon$datetime, col = "Blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(pwercon$Global_reactive_power ~ pwercon$datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()