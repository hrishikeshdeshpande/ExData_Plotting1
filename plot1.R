#read data

powerData<- read.table("household_power_consumption.txt", 
                       sep=";", header=TRUE, quote= "", 
                       strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subset the data related to first two days of Feb 2007 

ExtrPowData<- subset(powerData, 
                     (powerData$Date %in% c("1/2/2007","2/2/2007")
                     )
                    ) 
                     
# create Plot and save to plot1.png
   
png("plot1.png", width=480, height= 480) 

hist(ExtrPowData$Global_active_power, 
     col= "red", xlab= "Global Active Power (kilowatts)", 
     ylab= "Frequency", main= "Global Active Power")

dev.off()                     
                   
                     
                     
                    
