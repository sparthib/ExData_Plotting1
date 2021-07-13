data <- read.delim("C:\\Users\\Sowmya\\Downloads\\household_power_consumption.txt", 
                   header = TRUE, sep = ";", dec = ".")


data$Date <-as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time , format = "%H:%M:%S")

newdata <- subset(data, Date == '2007-02-01' | Date =='2007-02-02')

newdata$Global_active_power <- as.numeric(newdata$Global_active_power)


x <- 0:2879


plot(x, newdata$Global_active_power, type="l", ylab="Global Active Power(kilowatts)", 
     main="Global Active Power", axes = FALSE)
axis(2)
axis(side = 2, at = c())
axis(side = 1, at = c(0, 1440,2879), labels =  c('Thu', 'Fri', 'Sat'))
box(which = 'plot')
p1.base <- recordPlot()
invisible(dev.off())


# Display the saved plot
grid::grid.newpage()
p1.base

png("D:\\plot2.png", width = 480, height = 480)
p1.base
dev.off()


