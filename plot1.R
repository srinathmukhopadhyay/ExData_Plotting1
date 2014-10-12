library(lubridate)
# Read data into a table with appropriate classes
powerdata <- read.table('household_power_consumption.txt', header=TRUE,
                       sep=';', na.strings='?',
                       colClasses=c("character","character","double","double","double","double","double","double","numeric"))

# convert Date and Time variables to Date/Time classes

powerdata$Date <- dmy(powerdata$Date)
powerdata$Time <- hms(powerdata$Time)

# Reduce data frame to what we need
power <- subset(powerdata, year(Date) == 2007 & 
                     month(Date) == 2 &
                     (day(Date) == 1 | day(Date) == 2))
powerdata$date.time <- powerdata$Date + powerdata$Time

png(filename="plot1.png", width=480, height=480)
hist(power$Global_active_power, 
     col="#ff2500", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()
