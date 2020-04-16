require(data.table)
library(lubridate)
library(Hmisc)
dt <- fread("H:\\LITERATURA_i_POBRANE\\R_kurs\\Cursera R\\Exploratory-Data-Analysis-Week-1\\household_power_consumption.txt")
dt$Date <- dmy( dt$Date )
dt <- dt[Date >= "2007-07-01" & Date <= "2007-07-02", ]
dt$data <- paste0(dt$Date , " " ,dt$Time)
dt$data <-  ymd_hms(dt$data)

dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)
dt$Voltage <- as.numeric(dt$Voltage)


#### plot 1


hist(dt$Global_active_power , col = "red", ylim = range(0, 1300) , xlim = range(0,6), 
     main = "Global Active Power" , xlab="Global Active Power (kilowatts)")


dev.copy(png, file="plot1.png",
    width = 480, height = 480)
dev.off()



