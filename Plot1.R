Plot1 <- function(){
  setwd("C:/Users/User/Documents/Data Science/Module 4")
  #read the whole table
  table1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings=c("NA","?"))
  
  #select only the records for 1 and 2 of Feb 2007
  table2 <- subset(table1, Date == "1/2/2007" | Date == "2/2/2007")
  
  #open the PNG device
  png(filename = "plot1.png", width = 480, height = 480)
  
  #generate the histogram
  hist(table2$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")

  #close the PNG device
  dev.off()
}