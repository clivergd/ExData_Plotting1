#read data from txt file
hps <- read.table("~/Data Science/R/household_power_consumption.txt", header=TRUE, sep=";")

#format date column as date (from numeric)
hps$Date <-as.Date(hps$Date, format='%d/%m/%Y')

#select the data for use
aData <- hps[hps$Date %in% as.Date(c('2007-02-01','2007-02-02')), ]

#output the plot as .png
png("ExData_Plotting1/figure/plot1.png", width = 480, height = 480)

#red histogram showing data
hist(as.numeric(as.character(aData$Global_active_power)), xlab="Global Active Power(kilowatts)", xlab="" col = "red", main="Global Active Power")
dev.off()