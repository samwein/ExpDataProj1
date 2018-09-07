plot4 <- function(){
  
  #read in data
  datafile <- "./household_power_consumption.txt"
  data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors=FALSE, na.strings = "?")
  
  #subset data to 2007-02-01 and 2007-02-02
  data <- data[grep("^1/2/2007|^2/2/2007", data$Date),]
 
  
  #convert Data and Time fields to appropriate classes
  data$DateTime <- paste(data$Date, data$Time)
  data$DateTime <- as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  #add weekday field
  day <- weekdays(data$DateTime)
  data$Day <- as.factor(day)
  
  #open png file
  png(filename = "plot4.png", width = 480, height = 480, units = "px")
  
  #Set to multiple plots on device
  par(mfrow = c(2,2))
  
  #Add plot 1
  plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  #Add plot 2
  plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  #Add plot 3
  plot(data$DateTime, data$Sub_metering_1, type = "l", ylim = c(0,38), xlab = "", ylab = "Energy sub metering")
  par(new = TRUE)
  plot(data$DateTime, data$Sub_metering_2, ylim = c(0,38), col = "red", type = "l", xlab = "", ylab = "", )
  par(new = TRUE)
  plot(data$DateTime, data$Sub_metering_3, ylim = c(0,38), col = "blue", type = "l", xlab = "", ylab = "", )
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Add plot 4
  plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "GLobal_reactive_power")
  
  #turn off graphics device
  dev.off()
}