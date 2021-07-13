data <- read.delim("C:\\Users\\Sowmya\\Downloads\\household_power_consumption.txt", 
                   header = TRUE, sep = ";", dec = ".")


data$Date <-as.Date(data$Date, "%d/%m/%Y")
data$Time <- as.POSIXct(data$Time , format = "%H:%M:%S")

newdata <- subset(data, Date == '2007-02-01' | Date =='2007-02-02')

x <- 0:2879 

plot( x, newdata$Sub_metering_1, col = 'black', type="l", axes = FALSE,
      ylab = 'Energy sub metering', xlab= '')
lines(x, newdata$Sub_metering_2, col = 'red', type="l")
lines(x, newdata$Sub_metering_3, col = 'blue', type = 'l')
axis(2)
axis(side = 1, at = c(0, 1440,2879), labels =  c('Thu', 'Fri', 'Sat'))
box(which = 'plot')
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
p1.base <- recordPlot()


png("D:\\plot3.png", width = 480, height = 480)
p1.base
dev.off()

