library(dplyr)
library(datasets)
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data2<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
Global_Active_Power<-as.numeric(data2$Global_active_power)/500
hist(Global_Active_Power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()