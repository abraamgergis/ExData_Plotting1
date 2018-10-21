#Introduction + Loading and Preparing the data:
  
  #Refer to Plot1 code
setwd("~/Exploratory Data Analysis")

colNames <- names(read.table("~/Exploratory Data Analysis/household_power_consumption.txt", 
                             nrow=1, header=TRUE, sep=";"))

pwercon <- read.table("~/Exploratory Data Analysis/household_power_consumption.txt", 
              na.strings = "?", skip = grep("^[1,2]/2/2007", 
              readLines("~/Exploratory Data Analysis/household_power_consumption.txt"))-1, nrow = 2879, 
              sep = ";", header = FALSE, col.names = colNames)

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

data$datetime <- as.POSIXct(data$datetime)

#Plotting the data:
  
png(filename = "plot2.png", width = 480, height = 480)

plot(data = pwercon, x = pwercon$datetime, y = pwercon$Global_active_power, type = "l",
     ylab = "Global Active Power(kilowatts)", xlab = "")

dev.off()
