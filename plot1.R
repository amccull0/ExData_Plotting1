# Read in file.  I downloaded the file manually and unzipped it to a folder in my working directory
                # ./household_power_consumption

datain<-read.table("./household_power_consumption/household_power_consumption.txt",
                   header = TRUE, sep= ";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
#subset to the two days that we would like to look at
subSetData <- datain[datain$Date %in% c("1/2/2007","2/2/2007") ,]

# Create Histogram
png("plot1.png", width=480, height=480)
hist(subSetData$Global_active_power, col= "red", main= "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
