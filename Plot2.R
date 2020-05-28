#PLOT 2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset Baltimore
NEI <- subset(NEI, NEI$fips=="24510")
NEI <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
NEI
colnames(NEI) <-c("Year", "Emissions")

## plot
png("Plot2.png", width=480, height=480)
plot(NEI$Year,NEI$Emissions,
     xlab="Year",
     ylab="Total Emissions for Baltimore (FIPS# 24510)")