#plot3.R

if (! exists("read_UCI_Data"))
    source("./readData.R")

# read in dataset
dataset <- read_UCI_Data()

# Plot3 - plot energy consumption variables Sub_metering_1,2,3 on same graph.  
png(filename = "plot3.png", width=480, height=480)
with(dataset, {
        # plot datetime against energy consumption variables, suppress x-axis ticks
        plot.ts(datetime,y=Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n", xaxt="n")
        
        # setup the 3 X-axis ticks
        axis(1, at =as.numeric(as.POSIXct(c("2007/2/1", "2007/2/2","2007/2/3"))) , labels= c("Thu", "Fri", "Sat")) 
        
        # add lines to plot, ie. connect the dots
        lines(datetime, Sub_metering_1, col = "black")
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
        
        # add legend
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = 
               c("black","red","blue"), lwd=1)
    }
)
dev.off()