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


#### plot 2

dt_plot_2 <- dt[,.(Global_active_power, data)][order(-data)]
plot(dt_plot_2$data, dt_plot_2$Global_active_power, type="n",  
     ylab = "Global Active Power (kilowatts)", xlab ="")
lines(dt_plot_2$data, dt_plot_2$Global_active_power, type = "l")
dev.copy(png, file = "plot2.png",
         width = 480, height = 480)
dev.off()


