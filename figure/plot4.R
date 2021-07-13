data <- read.delim("C:\\Users\\Sowmya\\Downloads\\household_power_consumption.txt", 
                   header = TRUE, sep = ";", dec = ".")


data$Date <-as.Date(data$Date, "%d/%m/%Y")
data$Time <- as.POSIXct(data$Time , format = "%H:%M:%S")

newdata <- subset(data, Date == '2007-02-01' | Date =='2007-02-02')

x <- 0:2879 









par(mfrow = c(2,2))

  plot(x, newdata$Global_active_power, type="l", ylab="Global Active Power(kilowatts)", 
       axes = FALSE)
  axis(2)
  axis(side = 2, at = c())
  axis(side = 1, at = c(0, 1440,2879), labels =  c('Thu', 'Fri', 'Sat'))
  box(which = 'plot')
  
  plot( x, newdata$Voltage, col = 'black', type="l", axes = FALSE,
        ylab = 'Voltage', xlab= 'datetime')
  axis(2)
  axis(side = 1, at = c(0, 1440,2879), labels =  c('Thu', 'Fri', 'Sat'))
  box(which = 'plot')
  
  plot( x, newdata$Sub_metering_1, col = 'black', type="l", axes = FALSE,
        ylab = 'Energy sub metering', xlab= '')
  lines(x, newdata$Sub_metering_2, col = 'red', type="l")
  lines(x, newdata$Sub_metering_3, col = 'blue', type = 'l')
  axis(2)
  axis(side = 1, at = c(0, 1440,2879), labels =  c('Thu', 'Fri', 'Sat'))
  box(which = 'plot')
  
  plot( x, newdata$Global_reactive_power, col = 'black', type="l", axes = FALSE,
        ylab = 'Global_reactive_power', xlab= 'datetime')
  axis(2)
  axis(side = 1, at = c(0, 1440,2879), labels =  c('Thu', 'Fri', 'Sat'))
  box(which = 'plot')
  
plot4.base <- recordPlot()
invisible(dev.off())

# Display the saved plot
grid::grid.newpage()
plot4.base

png("D:\\plot4.png", width = 480, height = 480)
plot4.base
dev.off()
