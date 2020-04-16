require(data.table)

library(lubridate)

library(Hmisc)

Sys.setlocale("LC_TIME", "English")

dt <- fread("H:\\LITERATURA_i_POBRANE\\R_kurs\\Cursera R\\Exploratory-Data-Analysis-Week-1\\household_power_consumption.txt")

dt$Date <- dmy( dt$Date )

dt <- dt[Date >= "2007-07-01" & Date <= "2007-07-02", ]

dt$data <- paste0(dt$Date , " " ,dt$Time)

dt$data <-  ymd_hms(dt$data)



dt$Global_active_power <- as.numeric(dt$Global_active_power)

dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)

dt$Voltage <- as.numeric(dt$Voltage)





#### plot 3



dt_plot_3 <- dt[,.(Global_active_power, data, Sub_metering_1, Sub_metering_2, Sub_metering_3)][order(data)]

par(mfrow=c(1,1))

plot(x = dt_plot_3$data ,y = dt_plot_3$Sub_metering_1 ,  type="n", 
     
     ylab = "Energy sub meting", xlab ="")

lines(dt_plot_3$data, dt$Sub_metering_1, type = "l", col = "black")

lines(dt_plot_3$data, dt$Sub_metering_2, type = "l", col = "red")

lines(dt_plot_3$data, dt$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3"))

#### save plot

dev.copy(png, file = "plot3.png",
         
         width = 480, height = 480)

dev.off()