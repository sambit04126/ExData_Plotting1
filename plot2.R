powercon<-read.table("./data/household_power_consumption.txt",sep=";"
                     ,header=TRUE,colClasses = c("character","character",
                                                 "numeric","numeric","numeric",
                                                 "numeric","numeric","numeric"
                                                 ,"numeric"),na.strings = "?");

powercon1<-powercon[powercon$Date=="1/2/2007"|powercon$Date== "2/2/2007",];

powercon1$Datetime <-paste(powercon1$Date,powercon1$Time);
powercon1$Datetime<-strptime(powercon1$Datetime,"%d/%m/%Y %H:%M:%S");
plot.new();
png("plot2.png",width=480,height=480)
plot(x=powercon1$Datetime,y=powercon1$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="");
dev.off();