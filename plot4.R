powercon<-read.table("./data/household_power_consumption.txt",sep=";"
                     ,header=TRUE,colClasses = c("character","character",
                                                 "numeric","numeric","numeric",
                                                 "numeric","numeric","numeric"
                                                 ,"numeric"),na.strings = "?");

powercon1<-powercon[powercon$Date=="1/2/2007"|powercon$Date== "2/2/2007",];

powercon1$Datetime <-paste(powercon1$Date,powercon1$Time);
powercon1$Datetime<-strptime(powercon1$Datetime,"%d/%m/%Y %H:%M:%S");

plot.new()
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(x=powercon1$Datetime,y=powercon1$Global_active_power,ylab="Global Active Power",xlab=NA,type="l")
plot(x=powercon1$Datetime,y=powercon1$Voltage,ylab="Voltage",xlab="datetime",type="l")
plot(powercon1$Datetime,powercon1$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(powercon1$Datetime,powercon1$Sub_metering_2,type="l",col="red")
points(powercon1$Datetime,powercon1$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1",
                                                         "Sub_metering_2",
                                                         "Sub_metering_3"),lwd=2,bty="n",cex=0.75)
plot(x=powercon1$Datetime,y=powercon1$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
dev.off();