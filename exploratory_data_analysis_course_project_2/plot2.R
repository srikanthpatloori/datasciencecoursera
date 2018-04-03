##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
##Use the base plotting system to make a plot answering this question.

#Prerequisites: Down Load Zip file and Extract files from Zip folder

#Set working directory where the source files and script files are exists 

#Read Data from rds files

NEI <- readRDS("summarySCC_PM25.rds")

#Aggregate Emissions By Year

fipsNEI  <- NEI[NEI$fips=="24510", ]

EmissionsByYear <- aggregate(Emissions ~ year, fipsNEI, sum)

#Creating png File

png('plot2.png')

#Generating Barplot

barplot(height=EmissionsByYear$Emissions, names.arg=EmissionsByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))

#Closing The File

dev.off()
