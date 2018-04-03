##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
##Which have seen increases in emissions from 1999 2008? 
##Use the ggplot2 plotting system to make a plot answer this question.

#Prerequisites: Down Load Zip file and Extract files from Zip folder

#Set working directory where the source files and script files are exists 

#Read Data from rds files

NEI <- readRDS("summarySCC_PM25.rds")

#Aggregate Emissions By Year and type

fipsNEI  <- NEI[NEI$fips=="24510", ]

EmissionsByYearandtype <- aggregate(Emissions ~ year + type, fipsNEI, sum)

#Creating png File

png("plot3.png", width=640, height=480)

#assign ggplot library

library(ggplot2)

#Generating ggplot

g <- ggplot(EmissionsByYearandtype, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)

#Closing The File

dev.off()
