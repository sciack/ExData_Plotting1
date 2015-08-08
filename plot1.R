plot1 <- function() {
  #Read data
  household_data <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
  household_data$Time <- strptime(paste(household_data$Date," ", household_data$Time),format="%d/%m/%Y %H:%M:%S")
  household_data$Date <- as.Date(household_data$Date,format="%d/%m/%Y")
  #Subset
  myData <- subset(subset(household_data, Date >= as.Date("01-02-2007", format="%d-%m-%Y")), Date <= as.Date("02-02-2007", format="%d-%m-%Y"))
  myData$Global_active_power <- as.numeric(myData$Global_active_power)
  #Plot the histogram
  png("plot1.png",width = 480, height = 480)
  hist(myData$Global_active_power, main = "Global active power", col = "red",xlab = "Global Active Power (kilowatts)")
  dev.off()
}