Sys.setlocale("LC_TIME", "C")
# reading file
HPC<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)

# subset to 2007-02-01 and 2007-02-02
sub<-HPC[which(as.character(HPC$Date)=="1/2/2007"|as.character(HPC$Date)=="2/2/2007"),]
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# convert columns to numeric
sub$Global_active_power  <- as.numeric(as.character(sub$Global_active_power))
sub$Sub_metering_1<- as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2<- as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3<- as.numeric(as.character(sub$Sub_metering_3))

#make plot3
png("plot3.png", width = 480, height = 480)
plot(sub$DateTime, sub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub$DateTime, sub$Sub_metering_2, type="l", col="red")
lines(sub$DateTime, sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
