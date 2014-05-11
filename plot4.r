Sys.setlocale("LC_TIME", "C")
# reading file
HPC<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)

# subset to 2007-02-01 and 2007-02-02
sub<-HPC[which(as.character(HPC$Date)=="1/2/2007"|as.character(HPC$Date)=="2/2/2007"),]
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# convert to numeric
sub$Global_active_power  <- as.numeric(as.character(sub$Global_active_power))
sub$Global_reactive_power<- as.numeric(as.character(sub$Global_reactive_power))
sub$Voltage<- as.numeric(as.character(sub$Voltage)) 
sub$Sub_metering_1<- as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2<- as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3<- as.numeric(as.character(sub$Sub_metering_3))

#make plot4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#top-left plot
plot(sub$DateTime, sub$Global_active_power, type="l", ylab= "Global Active Power", xlab="")

#top-right plot
plot(sub$DateTime,sub$Voltage,type="l",ylab="Voltage",xlab="datetime")

#bottom-left plot
plot(sub$DateTime, sub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub$DateTime, sub$Sub_metering_2, type="l", col="red")
lines(sub$DateTime, sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#bottom-right plot
plot(sub$DateTime,sub$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()