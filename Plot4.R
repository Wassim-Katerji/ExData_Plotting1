Plot4 <- function(){
  setwd("C:/Users/User/Documents/Data Science/Module 4")
  #read the whole table
  table1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("NA","?"))
  
  #select only the records for 1 and 2 of Feb 2007
  table2 <- subset(table1, Date == "1/2/2007" | Date == "2/2/2007")
  
  
  
  #open the PNG device
  png(filename = "plot4.png", width = 480, height = 480)
  
  #set a 2x2 layout
  par(mfrow = c(2, 2))
  
  #get the date time
  DateTime <- strptime(paste(table2$Date, table2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  #generate 1st plot
  plot(DateTime, table2$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  
  #2nd plot
  plot(DateTime, table2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  
  #3rd plot
  plot(DateTime, table2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(DateTime, table2$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
  points(DateTime, table2$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
  points(DateTime, table2$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  
  #4th plot
  plot(DateTime, table2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))
  
  #close the PNG device
  dev.off()
}