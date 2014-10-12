library(lubridate)
# Read data into a table with appropriate classes
powerdata <- read.table('household_power_consumption.txt', header=TRUE,
                        sep=';', na.strings='?',
                        colClasses=c("character","character","double","double","double","double","double","double","numeric"))

# convert Date and Time variables to Date/Time classes

powerdata$Date <- dmy(powerdata$Date)
powerdata$Time <- hms(powerdata$Time)
powerdata$date.time <- powerdata$Date + powerdata$Time
# Reduce data frame to what we need
power <- subset(powerdata, year(Date) == 2007 & 
                  month(Date) == 2 &
                  (day(Date) == 1 | day(Date) == 2))


png(filename="plot3.png", width=480, height=480)
# Make plot
plot(power$date.time, power$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(power$date.time, power$Sub_metering_2, col='red')
lines(power$date.time, power$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')
dev.off()
