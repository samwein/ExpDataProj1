plot1 <- function(){
  
  #read in data
  datafile <- "./household_power_consumption.txt"
  data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors=FALSE, na.strings = "?")
  
  #subset data to 2007-02-01 and 2007-02-02
  data <- data[grep("^1/2/2007|^2/2/2007", data$Date),]
  
  
  #convert Data and Time fields to appropriate classes
  data$DateTime <- paste(data$Date, data$Time)
  data$DateTime <- as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  #open png file
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  
  #plot histogram
  hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
  
  #turn off graphics device
  dev.off()

  }