####plot2#######
#WORKING DIRECTORY
getwd()
setwd("C:/Users/nawaraj/Desktop/ex_data_analysis/week_1")
#READING DATASET
data=read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE,dec = ".")
head(data)
names(data)
#SUBSETTING DATA SET within the specified time frame

subset_data=data[data$Date %in% c("1/2/2007","2/2/2007"),]
#checking structure of the sub setted data set
str(subset_data)
date_time=strptime(paste(subset_data$Date,subset_data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#converting global active power to teh appropriate format.
globalActivePower<-as.numeric(subset_data$Global_active_power)
png("plot2.png",height = 480,width = 480)
plot(date_time,globalActivePower,xlab="",ylab = "Global Active Power (kilowatts)",type="l")
##Turn off the device
dev.off()
