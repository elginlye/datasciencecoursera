#plot4.R

if (! exists("read_UCI_Data"))
    source("./readData.R")

# read in dataset
dataset <- read_UCI_Data()

# Plot4 - plot 4 graphs,   
png(filename = "plot4.png", width=480, height=480)
with(dataset, {
        # make 4 plots row-wise fashion
        par(mfrow = c(2,2)) 
        
        # Graph1 @ top left, plot datetime against Global_active_power, suppress x-axis ticks
        plot.ts(datetime,y=Global_active_power, ylab="Global Active Power", xlab="", type="n", xaxt="n")
        lines(datetime, Global_active_power)
        axis(1, at =as.numeric(as.POSIXct(c("2007/2/1", "2007/2/2","2007/2/3"))) , labels= c("Thu", "Fri", "Sat")) 
        
        # Graph2 @ top right, plot datetime against Global_active_power, suppress x-axis ticks    
        plot.ts(datetime,y=Voltage, xlab="datetime", type="n", xaxt="n")
        lines(datetime, Voltage)
        axis(1, at =as.numeric(as.POSIXct(c("2007/2/1", "2007/2/2","2007/2/3"))) , labels= c("Thu", "Fri", "Sat")) 
        
        # Graph3 @ bottom left, plot datetime against energy consumption variables, suppress x-axis ticks    
        plot.ts(datetime,y=Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n", xaxt="n")
        lines(datetime, Sub_metering_1, col = "black")
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
        axis(1, at =as.numeric(as.POSIXct(c("2007/2/1", "2007/2/2","2007/2/3"))) , labels= c("Thu", "Fri", "Sat")) 
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = 
                   c("black","red","blue"), lwd=1, bty="n")
        
        # Graph4 @ bottom right, plot datetime against Global_reactive_power, suppress x-axis ticks    
        plot.ts(datetime,y=Global_reactive_power, xlab="datetime", type="n", xaxt="n")
        lines(datetime, Global_reactive_power)        
        axis(1, at =as.numeric(as.POSIXct(c("2007/2/1", "2007/2/2","2007/2/3"))) , labels= c("Thu", "Fri", "Sat")) 
    }
)
dev.off()

