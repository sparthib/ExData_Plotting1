data <- read.delim("C:\\Users\\Sowmya\\Downloads\\household_power_consumption.txt", 
                   header = TRUE, sep = ";", dec = ".")


data$Date <-as.Date(data$Date, "%d/%m/%Y")
data$Time <- as.POSIXct(data$Time , format = "%H:%M:%S")

newdata <- subset(data, Date == '2007-02-01' | Date =='2007-02-02')

newdata$Global_active_power <- as.numeric(newdata$Global_active_power)


hist(newdata$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col = "red")
p1.base <- recordPlot()
invisible(dev.off())


# Display the saved plot
grid::grid.newpage()
p1.base

png("D:\\plot1.png", width = 480, height = 480)
p1.base
dev.off()



