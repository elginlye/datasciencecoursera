#plot2.R

if (! exists("read_UCI_Data"))
    source("./readData.R")

# read in dataset
dataset2 <- read_UCI_Data()

# Plot2 - time series for variable Global_active_power
png(filename = "plot2.png", width=480, height=480)
with(dataset2, {
        # plot datetime against Global_active_power, suppress x-axis ticks
        plot.ts(datetime,y=Global_active_power, ylab="Global Active Power(kilowatts)", xlab="", type="n", xaxt="n")
        
        # setup the 3 X-axis ticks
        axis(1, at =as.numeric(as.POSIXct(c("2007/2/1", "2007/2/2","2007/2/3"))) , labels= c("Thu", "Fri", "Sat")) 
        
        # add lines to plot, ie. connect the dots
        lines(datetime, Global_active_power, col = "black")
    }
)
dev.off()