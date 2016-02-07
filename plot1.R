####plot1#######
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
###converting the character variable to numeric one
golbalActivePower=as.numeric(subset_data$Global_active_power)
###opening the device for graphics
png("plot1.png",width = 480,height = 480)
hist(golbalActivePower,main="Global Active Power",xlab="Global Active Power (kilowatts)",col = "red")
##Turn off the device
dev.off()

