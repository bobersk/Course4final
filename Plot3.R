#PLOT 2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset Baltimore
NEI <- subset(NEI, NEI$fips=="24510")

unique(NEI$type)

POINT <- subset(NEI, NEI$type=="POINT")
NONPOINT <- subset(NEI, NEI$type=="NONPOINT")
ONROAD <- subset(NEI, NEI$type=="ON-ROAD")
NONROAD <- subset(NEI, NEI$type=="NON-ROAD")

POINTsum <- aggregate(POINT$Emissions, by=list(POINT$year), FUN=sum)
colnames(POINTsum) <-c("Year", "Emissions")

NONPOINTsum <- aggregate(NONPOINT$Emissions, by=list(NONPOINT$year), FUN=sum)
colnames(NONPOINTsum) <-c("Year", "Emissions")

ONROADsum <- aggregate(ONROAD$Emissions, by=list(ONROAD$year), FUN=sum)
colnames(ONROADsum) <-c("Year", "Emissions")

NONROADsum <- aggregate(NONROAD$Emissions, by=list(NONROAD$year), FUN=sum)
colnames(NONROADsum) <-c("Year", "Emissions")

newmatrix <- cbind(POINTsum$Year, POINTsum$Emissions, NONPOINTsum$Emissions, ONROADsum$Emissions, NONROADsum$Emissions)
colnames(newmatrix) <- c("Year", "Point", "NonPoint", "OnRoad", "NonRoad")

newmatrix <- data.frame(newmatrix)

options(scipen=999)  # turn-off scientific notation like 1e+48
library(ggplot2)
theme_set(theme_bw())

library(ggplot2)
library(reshape2)
meltdf <- melt(newmatrix,id="Year")
png(filename = "plot3.png")
ggplot(meltdf,aes(x=Year,y=value,colour=variable,group=variable)) +
        geom_line() +
        ylab("Emissions")