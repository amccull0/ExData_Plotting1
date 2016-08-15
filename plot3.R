# Read in file.  I downloaded the file manually and unzipped it to a folder in my working directory
                # ./household_power_consumption

datain<-read.table("./household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep= ";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
#subset to the two days that we would like to look at
subSetData <- datain[datain$Date %in% c("1/2/2007","2/2/2007") ,]

# Create Line graph
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub1 <- as.numeric(subSetData$Sub_metering_1)
sub2 <- as.numeric(subSetData$Sub_metering_2)
sub3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub1, type="l", 
     xlab = "", ylab = "Energy sub metering" )
lines(datetime,sub2, type= "l", col= "red")
lines(datetime,sub3, type= "l", col= "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2,
       col=c("black","red","blue"))
dev.off()
