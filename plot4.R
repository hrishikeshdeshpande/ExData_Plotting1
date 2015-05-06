#read data

powerData<- read.table("household_power_consumption.txt", 
                       sep=";", header=TRUE, quote= "", 
                       strip.white=TRUE, stringsAsFactors = FALSE, 
                       na.strings= "?")

# Subset the data related to first two days of Feb 2007 

ExtrPowData<- subset(powerData, 
                     (powerData$Date %in% c("1/2/2007","2/2/2007")
                     )
                    ) 
                     
# change the date column to date/time class

ExtrPowData$Date <- as.Date(ExtrPowData$Date, format = "%d/%m/%Y")

ExtrPowData$DateTime <- as.POSIXct(paste(ExtrPowData$Date, ExtrPowData$Time))

# create Plot and save to plot4.png

png("plot4.png", width=480, height= 480)

par(mfrow=c(2,2)) 

# graph 1 - top left
plot(ExtrPowData$DateTime, 
     ExtrPowData$Global_active_power, 
     ylab= "Global Active Power (kilowatts)", xlab="", type= "l", lwd=1) 

# graph 2 - top right
plot(ExtrPowData$DateTime, 
     ExtrPowData$Voltage, 
     xlab="datetime", ylab="Voltage", type="l")   

# graph 3 - bottom left
plot(ExtrPowData$DateTime, 
     ExtrPowData$Sub_metering_1, 
     ylab= "Energy sub metering", xlab="", type="l")

    lines(ExtrPowData$DateTime, ExtrPowData$Sub_metering_2, type="l", col="red")
    lines(ExtrPowData$DateTime, ExtrPowData$Sub_metering_3, type="l", col="blue")

    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 

# graph 4 - bottom right
plot(ExtrPowData$DateTime, 
     ExtrPowData$Global_reactive_power, 
     xlab="datetime", ylab="Global_reactive_power", type="l")  

dev.off()