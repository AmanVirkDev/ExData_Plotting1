
#path and name of data file
filePath<-"household_power_consumption.txt"

#load data from file
ElectricPwrConsptData<-read.table(filePath,sep=';',header=TRUE,na.strings="?",colClasses='character')

# Convert to Date/Time clsases
ElectricPwrConsptData[,1] <- as.Date(ElectricPwrConsptData$Date,"%d/%m/%Y")

# Create a subset of the data between 2007-02-01 and 2007-02-02
subData <- subset(ElectricPwrConsptData, ElectricPwrConsptData$Date %in% as.Date(c("2007-02-01","2007-02-02")))

subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%Y-%m-%d %H:%M:%S")

# Cast the rest of the columns as numeric
subData[,3] <- as.numeric(subData[,3])
subData[,4] <- as.numeric(subData[,4])
subData[,5] <- as.numeric(subData[,5])
subData[,6] <- as.numeric(subData[,6])
subData[,7] <- as.numeric(subData[,7])
subData[,8] <- as.numeric(subData[,8])
subData[,9] <- as.numeric(subData[,9])

# Create Plot 2
plot(subData$DateTime, subData[,3], type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

# Copy to PNG file for submission
dev.copy(png,file="plot2.png")

# Close device
dev.off()