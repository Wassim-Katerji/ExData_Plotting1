Plot2 <- function(){
  setwd("C:/Users/User/Documents/Data Science/Module 4")
  #read the whole table
  table1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("NA","?"))
  
  #select only the records for 1 and 2 of Feb 2007
  table2 <- subset(table1, Date == "1/2/2007" | Date == "2/2/2007")
  
  #open the PNG device
  png(filename = "plot2.png", width = 480, height = 480)
  
  #generate the plot
  DateTime <- strptime(paste(table2$Date, table2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  plot(DateTime, table2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  #close the PNG device
  dev.off()
}