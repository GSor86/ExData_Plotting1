plot4 <- function() {
  x <- read.table('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, header = TRUE)
  
  x$Date <- as.Date(x$Date, '%d/%m/%Y')
  
  powerdata <- x[x$Date == '2007-02-01' | x$Date == '2007-02-02', ]
  
  powerdata$Time <- paste(powerdata$Date, powerdata$Time)
  
  powerdata$Time <- strptime(powerdata$Time, '%Y-%m-%d %H:%M:%S')
  
  cols.num <- c(3,4,5,6,7,8,9)
  
  powerdata[cols.num] <- sapply(powerdata[cols.num], as.numeric)
  
  png(file = 'plot4.png')
  par(mfrow = c(2,2))
  ##First plot
  with(powerdata, plot(Time, Global_active_power, xlab = '', ylab = 'Global Active Power', type = "n"))
  with(powerdata, lines(Time, Global_active_power))
  ##Second plot
  with(powerdata, plot(Time, Voltage, xlab = 'datetime', type = 'n'))
  with(powerdata, lines(Time, Voltage))
  ##Third plot
  with(powerdata, plot(Time, Sub_metering_1, ylab = 'Energy sub metering', xlab = '', type = 'n'))
  with(powerdata, lines(Time, Sub_metering_1))
  with(powerdata, lines(Time, Sub_metering_2, col = 'red'))
  with(powerdata, lines(Time, Sub_metering_3, col = 'blue'))
  legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty = 'n')
  ##Fourth plot
  with(powerdata, plot(Time, Global_reactive_power, xlab = 'datetime', type = 'n'))
  with(powerdata, lines(Time, Global_reactive_power))
  
  dev.off()
  
  ##Note that since I live a non-English part of the world the weekday abbreviations on the x-axis will be different.
  
}