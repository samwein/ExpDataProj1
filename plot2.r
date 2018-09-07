plot2 <- function(){
  
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
  png(filename = "plot2.png", width = 480, height = 480, units = "px")
  
  #plot line chart
  plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  #turn off graphics device
  dev.off()
  
}