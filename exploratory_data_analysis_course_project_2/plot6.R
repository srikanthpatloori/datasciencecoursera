## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
## vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

#Prerequisites: Down Load Zip file and Extract files from Zip folder

#Set working directory where the source files and script files are exists 

#Read Data from rds files

NEI <- readRDS("summarySCC_PM25.rds")

#filter Data

fipsNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

#Aggregate Emissions By Year

EmissionsByYearAndFips <- aggregate(Emissions ~ year + fips, fipsNEI, sum)
EmissionsByYearAndFips$fips[EmissionsByYearAndFips$fips=="24510"] <- "Baltimore, MD"
EmissionsByYearAndFips$fips[EmissionsByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

#Creating png File

png("plot6.png", width=1040, height=480)

#Assign ggplot library

library(ggplot2)

#Generating ggplot

g <- ggplot(EmissionsByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)

#Closing The File

dev.off()
