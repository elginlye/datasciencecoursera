# plot1.R

if (! exists("read_UCI_Data"))
    source("./readData.R")

# read in dataset
dataset2 <- read_UCI_Data()

# Plot1 - histogram for variable Global Active Power
png(filename = "plot1.png", width=480, height=480)
hist(dataset2$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
