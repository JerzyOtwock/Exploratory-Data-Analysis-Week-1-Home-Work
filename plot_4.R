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



par(mfrow=c(2,2))
#### plot 1
dt_plot_1 <- dt[,.(Global_active_power, data)][order(-data)]
plot(dt_plot_1$data, dt_plot_1$Global_active_power, type="n",  
     ylab = "Global Active Power (kilowatts)", xlab ="")
lines(dt_plot_1$data, dt_plot_1$Global_active_power, type = "l")

#### plot 2
dt_plot_2 <- dt[,.(Voltage, data)][order(-data)]
plot(dt_plot_2$data, dt_plot_2$Voltage, type="n",  
     ylab = "Voltage", xlab ="")
lines(dt_plot_2$data, dt_plot_2$Voltage, type = "l")

#### plot 3
dt_plot_3 <- dt[,.(Global_active_power, data, Sub_metering_1, Sub_metering_2, Sub_metering_3)][order(data)]
plot(x = dt_plot_3$data ,y = dt_plot_3$Sub_metering_1 ,  type="n",  ylab = "Energy sub meting", xlab ="")
lines(dt_plot_3$data, dt$Sub_metering_1, type = "l", col = "black")
lines(dt_plot_3$data, dt$Sub_metering_2, type = "l", col = "red")
lines(dt_plot_3$data, dt$Sub_metering_3, type = "l", col = "blue")

#### plot 4

dt_plot_4 <- dt[,.(Global_reactive_power, data)][order(-data)]
plot(dt_plot_4$data, dt_plot_4$Global_reactive_power, type="n",  
     ylab = "Global_reactive_power", xlab ="")
lines(dt_plot_4$data, dt_plot_4$Global_reactive_power, type = "l")

dev.copy(png, file = "plot4.png",
         width = 480, height = 480)
dev.off()

