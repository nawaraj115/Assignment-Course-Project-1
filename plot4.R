####plot3#######
#WORKING DIRECTORY
getwd()
setwd("C:/Users/nawaraj/Desktop/ex_data_analysis/week_1")
#READING DATASET
data=read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE,dec = ".")
head(data)
names(data)
#SUBSETTING DATA SET within the specified time frame
subset_data=data[data$Date %in% c("1/2/2007","2/2/2007"),]
date_time=strptime(paste(subset_data$Date,subset_data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#converting the variable to the apropriated format.
globalActivePower=as.numeric(subset_data$Global_active_power)
globalReactivePower <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)
subMetering1 <- as.numeric(subset_data$Sub_metering_1)
subMetering2 <- as.numeric(subset_data$Sub_metering_2)
subMetering3 <- as.numeric(subset_data$Sub_metering_3)
#making 2/2 frame to plot the four different graphics
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(date_time,globalActivePower,type="l",xlab="",ylab = "Global Actice Power",cex=0.2)
plot(date_time,voltage,type="l",ylab="Voltage",xlab = "datetime")
plot(date_time,sub_meter_1,type="l",ylab="Energy Submetering",xlab="")
lines(date_time,sub_meter_2,type="l",col="red")
lines(date_time,sub_meter_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd=2.5,col=c("black","red","blue"))
plot(date_time,globalReactivePower,type = "l",xlab="datetime",ylab = "Global Reactive_power")
dev.off()
