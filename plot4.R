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


png(filename="plot4.png", width=480, height=480)

## Make plots
par(mfrow=c(2,2))

# Top left
plot(power$date.time, power$Global_active_power,
     ylab='Global Active Power', xlab='', type='l')

# Top right
plot(power$date.time, power$Voltage,
     xlab='datetime', ylab='Voltage', type='l')

# Bottom left
plot(power$date.time, power$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(power$date.time, power$Sub_metering_2, col='red')
lines(power$date.time, power$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# Bottom right
plot(power$date.time, power$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')
dev.off()
