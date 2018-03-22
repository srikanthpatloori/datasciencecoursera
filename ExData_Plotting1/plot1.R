#Assigning a file name to fname variable
fname <- "household_power_consumption.txt"
#Creating a datafream 
data <- read.table(fname, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#Filtering Data based on given Dates
filteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#Converting charecter values to numaric
globalActivePower <- as.numeric(filteredData$Global_active_power)
#Creating a png file and adding graphs
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#Closing the png file 
dev.off()