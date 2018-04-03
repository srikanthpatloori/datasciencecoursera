## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#Prerequisites: Down Load Zip file and Extract files from Zip folder

#Set working directory where the source files and script files are exists 

#Read Data from rds files

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# merge the two data sets 

NEISCC <- merge(NEI, SCC, by="SCC")

# fetch all NEIxSCC records with Short.Name (SCC) Coal

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)

fipsNEISCC <- NEISCC[coalMatches, ]

#Aggregate Emissions By Year

EmissionsByYear <- aggregate(Emissions ~ year, fipsNEISCC, sum)

#Creating png File

png("plot4.png", width=640, height=480)

#assign ggplot library

library(ggplot2)

#Generating ggplot

g <- ggplot(EmissionsByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)

#Closing The File

dev.off()
