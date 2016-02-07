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
globalActivePower=as.numeric(subset_data$Global_active_power)
sub_meter_1=as.numeric(subset_data$Sub_metering_1)
sub_meter_2=as.numeric(subset_data$Sub_metering_2)
sub_meter_3=as.numeric(subset_data$Sub_metering_3)
png("plot3.png",height = 480,width = 480)
plot(date_time,sub_meter_1,type="l",ylab="Energy Submetering",xlab="")
lines(date_time,sub_meter_2,type="l",col="red")
lines(date_time,sub_meter_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd=2.5,col=c("black","red","blue"))
dev.off()
