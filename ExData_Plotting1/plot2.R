#Assigning a file name to fname variable
fname <- "household_power_consumption.txt"
#Creating a datafream 
data <- read.table(fname, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Filtering Data based on given Dates
filteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#Converting character values of date and time together 
datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Converting charecter values to numaric
globalActivePower <- as.numeric(filteredData$Global_active_power)
#Creating a png file and adding graphs
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Closing the png file 
dev.off()