library(dplyr)
library(lubridate)

pConsumption <- read.csv("/Users/tzujung/Documents/R_Coursera/household_power_consumption.txt",
                         sep = ";", na.strings = "?")

pConsumption <- filter(pConsumption, 
                       Date == "1/2/2007" | Date == "2/2/2007")
pConsumption$Date <- dmy(pConsumption$Date)
pConsumption$Time <- hms(pConsumption$Time)

pConsumption$DateTime <- pConsumption$Date + pConsumption$Time

png(filename = "plot4.png", height = 480, width = 480)

par(mfcol = (c(2,2)), mar = c(4,4,1,1))

plot(pConsumption$DateTime, pConsumption$Global_active_power,
     type="l",
     ylab = "Global Active Power",
     xlab = "")
plot(pConsumption$DateTime, pConsumption$Sub_metering_1,
     type="l",
     ylab ="Energy Submetering",
     xlab = "")
lines(pConsumption$DateTime, pConsumption$Sub_metering_2,
      type="l",
      col = "red")
lines(pConsumption$DateTime, pConsumption$Sub_metering_3,
      type="l",
      col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1,
       col=c("black", "red", "blue"))
plot(pConsumption$DateTime, pConsumption$Voltage,
     type="l",
     ylab ="Voltage",
     xlab = "datetime")
plot(pConsumption$DateTime, pConsumption$Global_reactive_power,
     type="l",
     ylab ="Voltage",
     xlab = "datetime")

dev.off()
