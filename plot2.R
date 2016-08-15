# Read in file.  I downloaded the file manually and unzipped it to a folder in my working directory
                # ./household_power_consumption

datain<-read.table("./household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep= ";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
#subset to the two days that we would like to look at
subSetData <- datain[datain$Date %in% c("1/2/2007","2/2/2007") ,]

# Create Line graph
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime,globalActivePower,type="l", 
     xlab = "", ylab = "Global Active Power (kilowatts)" )
dev.off()
