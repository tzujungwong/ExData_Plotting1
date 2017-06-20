install.packages("dplyr")
library(dplyr)

pConsumption <- read.csv("/Users/tzujung/Documents/R_Coursera/household_power_consumption.txt",
                         sep = ";", na.strings = "?")

pConsumption <- filter(pConsumption, 
                       Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png", height = 480, width = 480)

hist(pConsumption$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
