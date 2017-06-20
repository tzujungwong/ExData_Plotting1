install.packages("lubridate")
library(lubridate)

pConsumption <- read.csv("/Users/tzujung/Documents/R_Coursera/household_power_consumption.txt",
                         sep = ";", na.strings = "?")

pConsumption <- filter(pConsumption, 
                       Date == "1/2/2007" | Date == "2/2/2007")

pConsumption$Date <- dmy(pConsumption$Date)
pConsumption$Time <- hms(pConsumption$Time)
pConsumption$DateTime <- pConsumption$Date + pConsumption$Time

png(filename = "plot2.png", height = 480, width = 480)

plot(pConsumption$DateTime, pConsumption$Global_active_power,
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()
