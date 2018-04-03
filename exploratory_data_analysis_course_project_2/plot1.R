##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system. 
##Make a plot showing the total PM2.5 emission from all sources. 
##For each of the years 1999, 2002, 2005, and 2008.

#Prerequisites: Down Load Zip file and Extract files from Zip folder

#Set working directory where the source files and script files are exists 

#Read Data from rds files

NEI <- readRDS("summarySCC_PM25.rds")

#Aggregate Emissions By Year

EmissionsByYear <- aggregate(Emissions ~ year, NEI, sum)

#Creating png File

png('plot1.png')

#Generating Barplot

barplot(height=EmissionsByYear$Emissions, names.arg=EmissionsByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))

#Closing The File

dev.off()
