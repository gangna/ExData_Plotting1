Sys.setlocale("LC_TIME", "C")
# reading file
HPC<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)

# subset to 2007-02-01 and 2007-02-02
sub<-HPC[which(as.character(HPC$Date)=="1/2/2007"|as.character(HPC$Date)=="2/2/2007"),]
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# convert columns to numeric
sub$Global_active_power  <- as.numeric(as.character(sub$Global_active_power))

#make plot2
png("plot2.png", width = 480, height = 480)
plot(sub$DateTime, sub$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()