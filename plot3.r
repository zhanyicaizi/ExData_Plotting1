library(dplyr)
library(data.table)
library(datasets)
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
data2<-select(data,Date=="1/2/2007"|Date=="2/2/2007")
day<-strptime(paste(data2$Date, data2$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
data3<-data.frame("Day"=c(day),"Sub_metering_1"=data2$Sub_metering_1,"Sub_metering_2"=data2$Sub_metering_2,"Sub_metering_3"=data2$Sub_metering_3)
with(data3,{
  plot(day,Sub_metering_1,col="black",type="l",xlab="",ylab="Ennergy sub metering")
  points(day,as.numeric(Sub_metering_2)-5,type="l",col="red")
  points(day,Sub_metering_3,type="l",col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.copy(png,file="plot3.png")
dev.off()