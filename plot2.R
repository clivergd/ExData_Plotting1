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
png('ExData_Plotting1/figure/plot2.png', width = 480, height = 480)

#line graph showing data
plot(aData$dTime, as.numeric(as.character(aData$Global_active_power)), xlab="", type = "l", ylab= "Global Active Power(Kilowatts)")
dev.off()