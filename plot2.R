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

# create Plot and save to plot2.png
                     
png("plot2.png", width=480, height= 480)

plot(ExtrPowData$DateTime, 
     ExtrPowData$Global_active_power, 
     ylab= "Global Active Power (kilowatts)", xlab= "", type="l",lwd=1)
                     
dev.off()