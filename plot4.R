plot4 <- function() {
  ## Read Data from txt file
  household_data <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
  household_data$Time <- strptime(paste(household_data$Date," ", household_data$Time),format="%d/%m/%Y %H:%M:%S")
  household_data$Date <- as.Date(household_data$Date,format="%d/%m/%Y")
  ## Filter and convert data
  myData <- subset(subset(household_data, Date >= as.Date("01-02-2007", format="%d-%m-%Y")), Date <= as.Date("02-02-2007", format="%d-%m-%Y"))
  myData$Sub_metering_1 <- as.numeric(myData$Sub_metering_1)
  myData$Sub_metering_2 <- as.numeric(myData$Sub_metering_2)
  myData$Sub_metering_3 <- as.numeric(myData$Sub_metering_3)
  myData$Global_active_power <- as.numeric(myData$Global_active_power)
  myData$Global_reactive_power <- as.numeric(myData$Global_reactive_power)
  myData$Voltage <- as.numeric(myData$Voltage)
  ## Start plot system on png
  png("plot4.png",width = 480, height = 480)
  par(mfrow = c(2,2))
  #Plot global active power graph
  with(myData, plot(Time,Global_active_power,type="l", xlab = "", ylab="Global Active Power (Kilowatts)"))
  #Plot voltage graph
  with(myData, plot(Time, Voltage, type="l", xlab="datetime"))
  #Plot metering graph
  with(myData,plot(Time,Sub_metering_1,type="n", xlab ="",ylab = "Energy sub metering"))
  with(myData,lines(Time,Sub_metering_1, col ="black"))
  with(myData,lines(Time,Sub_metering_2, col ="red"))
  with(myData,lines(Time,Sub_metering_3, col ="blue"))
  #Add legend (not boxed)
  legend("topright",lty = 1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
  #Add Reactive power
  with(myData, plot(Time,Global_reactive_power, type="l", xlab="datetime"))
  dev.off()
}