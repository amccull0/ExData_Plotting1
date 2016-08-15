# Read in file.  I downloaded the file manually and unzipped it to a folder in my working directory
                # ./household_power_consumption

datain<-read.table("./household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep= ";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
#subset to the two days that we would like to look at
subSetData <- datain[datain$Date %in% c("1/2/2007","2/2/2007") ,]

# Create Variables to be used in output graphs
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
voltage <-subSetData$Voltage
sub1 <- as.numeric(subSetData$Sub_metering_1)
sub2 <- as.numeric(subSetData$Sub_metering_2)
sub3 <- as.numeric(subSetData$Sub_metering_3)

#creat file with 2x2 matrix for the four outputs
png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))
#plot top left
plot(datetime,globalActivePower,type="l", 
     xlab = "", ylab = "Global Active Power (kilowatts)" )
#plot bottom left
plot(datetime, sub1, type="l", 
     xlab = "", ylab = "Energy sub metering" )
lines(datetime,sub2, type= "l", col= "red")
lines(datetime,sub3, type= "l", col= "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2,
       col=c("black","red","blue"))
#plot top right
plot(datetime,voltage,type="l", 
     xlab = "datetime", ylab = "Vlotage" )
#plot bottom right
plot(datetime,subSetData$Global_reactive_power,type="l", 
     xlab = "datetime", ylab = "Global_reactive_power" )
dev.off()
