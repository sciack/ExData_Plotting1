plot3 <- function() {
  #Read Data
  household_data <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
  household_data$Time <- strptime(paste(household_data$Date," ", household_data$Time),format="%d/%m/%Y %H:%M:%S")
  household_data$Date <- as.Date(household_data$Date,format="%d/%m/%Y")
  #Subset data and convert
  myData <- subset(subset(household_data, Date >= as.Date("01-02-2007", format="%d-%m-%Y")), Date <= as.Date("02-02-2007", format="%d-%m-%Y"))
  myData$Sub_metering_1 <- as.numeric(myData$Sub_metering_1)
  myData$Sub_metering_2 <- as.numeric(myData$Sub_metering_2)
  myData$Sub_metering_3 <- as.numeric(myData$Sub_metering_3)
  
  #Plot with the different variables
  png("plot3.png",width = 480, height = 480)
  with(myData,plot(Time,Sub_metering_1,type="n", xlab ="",ylab = "Energy sub metering"))
  with(myData,lines(Time,Sub_metering_1, col ="black"))
  with(myData,lines(Time,Sub_metering_2, col ="red"))
  with(myData,lines(Time,Sub_metering_3, col ="blue"))
  legend("topright",lty = 1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}