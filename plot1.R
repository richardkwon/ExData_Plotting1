plot1 <- function() {
    
    setwd("C:\\Users\\kwonr\\Projects\\ExploratoryDataAnalysis\\week1")
    
    filename <- "./household_power_consumption.txt"
    EPC <- read.table(filename,header=TRUE,sep=";", na.strings = "?")
    
    EPC$Time <- paste(EPC$Date, EPC$Time, sep=" ")
    EPC$Date <- as.Date(EPC$Date, "%d/%m/%Y")
    EPC$Time <- strptime(EPC$Time, "%d/%m/%Y %H:%M:%S")
    
    start_date <- as.POSIXct("2007-02-01")
    end_date <- as.POSIXct("2007-02-02")
    all_dates <- seq(start_date, end_date, 86400)
    
    subEPC <- subset(EPC, EPC$Date %in% as.Date(all_dates))
    
    plot_file1 <- "./plot1.png"
    plot1 <- png(plot_file1, width=480, height=480, units="px", )
    hist(subEPC$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
    
    dev.off()
}