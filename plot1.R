plot1 <- function() {
  x <- read.table('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, header = TRUE)

x$Date <- as.Date(x$Date, '%d/%m/%Y')

powerdata <- x[x$Date == '2007-02-01' | x$Date == '2007-02-02', ]

powerdata$Time <- paste(powerdata$Date, powerdata$Time)

powerdata$Time <- strptime(powerdata$Time, '%Y-%m-%d %H:%M:%S')

cols.num <- c(3,4,5,6,7,8,9)

powerdata[cols.num] <- sapply(powerdata[cols.num], as.numeric)

hist(powerdata$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

dev.copy(png, file = 'plot1.png')

dev.off()

}