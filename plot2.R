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


png(filename="plot2.png", width=480, height=480)
plot(power$date.time, power$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)",
     xlab=" ",
     col="black")
dev.off()
