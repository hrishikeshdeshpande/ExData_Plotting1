#read data

powerData<- read.table("household_power_consumption.txt", 
                       sep=";", header=TRUE, quote= "", 
                       strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subset the data related to first two days of Feb 2007 

ExtrPowData<- subset(powerData, 
                     (powerData$Date %in% c("1/2/2007","2/2/2007")
                     )
                    ) 
                     
# change the date column to date/time class

ExtrPowData$Date <- as.Date(ExtrPowData$Date, format = "%d/%m/%Y")

ExtrPowData$DateTime <- as.POSIXct(paste(ExtrPowData$Date, ExtrPowData$Time))

# create Plot and save to plot3.png
                     
png("plot3.png", width=480, height= 480)

plot(ExtrPowData$DateTime, 
     ExtrPowData$Sub_metering_1, 
     type="l", ylab= "Energy sub metering", xlab="")

lines(ExtrPowData$DateTime, ExtrPowData$Sub_metering_2, type="l", col="red")

lines(ExtrPowData$DateTime, ExtrPowData$Sub_metering_3, type="l", col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))                     

dev.off()