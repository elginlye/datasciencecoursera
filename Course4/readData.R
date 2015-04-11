#readData.R

read_UCI_Data <- function() {
    # setup  classes for each column of data 
    classes <- c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric")
    
    # read in the data
    dataset <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, col.names = c("Date",  
                          "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                          "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?", 
                          stringsAsFactor=FALSE, colClasses=classes)
    
    # subset the 2 days of data
    dataset2 <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007", ]
    
    # create a new column to hold the converted date & time 
    dataset2 <- cbind(datetime = strptime(paste(dataset2$Date, dataset2$Time), format="%d/%m/%Y %H:%M:%S"), dataset2)
}