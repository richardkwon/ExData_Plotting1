plot4 <- function() {
    
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
    
    plot_file4 <- "./plot4.png"
    plot4 <- png(plot_file4, width=480, height=480, units="px", )
    
    par(mfrow=c(2,2))
    ## plot #1
    plot(subEPC$Time, subEPC$Global_active_power, xpd=TRUE, type="l", ylab = "Global Active Power", xlab="")
    
    ## plot #2
    plot(subEPC$Time, subEPC$Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    ## plot #3
    plot(subEPC$Time, subEPC$Sub_metering_1, type="l", xpd=TRUE, ylab="Energy sub metering", xlab="")
    lines(subEPC$Time, subEPC$Sub_metering_2, col="red")
    lines(subEPC$Time, subEPC$Sub_metering_3, col="blue")
    legend("topright", pch=151, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    ## plot #4
    plot(subEPC$Time, subEPC$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    
    dev.off()
}