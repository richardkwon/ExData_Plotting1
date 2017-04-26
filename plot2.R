plot2 <- function() {
    
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
    
    plot_file2 <- "./plot2.png"
    plot2 <- png(plot_file2, width=480, height=480, units="px", )
    plot(subEPC$Time, subEPC$Global_active_power, xpd=TRUE, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
    
    dev.off()
}