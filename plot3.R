#read data from txt file
hps <- read.table("~/Data Science/R/household_power_consumption.txt", header=TRUE, sep=";")

#format date column as date (from numeric)
hps$Date <-as.Date(hps$Date, format='%d/%m/%Y')

#select the data for use (time range)
aData <- hps[hps$Date %in% as.Date(c('2007-02-01','2007-02-02')), ]

#combine date and time
dTime<-as.POSIXct(paste(aData$Date,aData$Time))

#add a column adding data/time combine
aData <- cbind(aData,dTime)

#output the plot as .png
png('ExData_Plotting1/figure/plot3.png', width = 480, height = 480)

#lines graphs showing data
plot(aData$dTime,as.numeric(as.character(aData$Sub_metering_1)),type = "l", xlab="", ylab="Energy sub metering", format="%a")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(aData$dTime, as.numeric(as.character(aData$Sub_metering_2)),type = "l",col="red")
lines(aData$dTime, as.numeric(as.character(aData$Sub_metering_3)),type = "l",col="blue")

dev.off()