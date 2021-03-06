library(dplyr)
library(data.table)
library(datasets)
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data2<-select(data,Date=="1/2/2007"|Date=="2/2/2007")
Global_Active_Power<-as.numeric(data2$Global_active_power)/500
Day<-strptime(paste(data2$Date, data2$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
plot(Day,Global_Active_Power,type="l",xlab="")
dev.copy(png,file="plot2.png")
dev.off()
