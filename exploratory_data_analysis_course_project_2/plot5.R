## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#Prerequisites: Down Load Zip file and Extract files from Zip folder

#Set working directory where the source files and script files are exists 

#Read Data from rds files

NEI <- readRDS("summarySCC_PM25.rds")

#filter Data

fipsNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

#Aggregate Emissions By Year

EmissionsByYear <- aggregate(Emissions ~ year, fipsNEI, sum)

#Creating png File

png("plot5.png", width=840, height=480)

#assign ggplot library

library(ggplot2)

#Generating ggplot

g <- ggplot(EmissionsByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)

#Closing The File

dev.off()
