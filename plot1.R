powercon<-read.table("./data/household_power_consumption.txt",sep=";"
                     ,header=TRUE,colClasses = c("character","character",
                                                 "numeric","numeric","numeric",
                                                 "numeric","numeric","numeric"
                                                 ,"numeric"),na.strings = "?");

powercon1<-powercon[powercon$Date=="1/2/2007"|powercon$Date== "2/2/2007",];
plot.new();
png("plot1.png",width=480,height=480);
hist(powercon1$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylim =c(1,1200) );
dev.off();