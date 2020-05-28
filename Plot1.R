#PLOT 1

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


attach(NEI)
NEInew <- cbind(NEI$year,NEI$Emissions)
colnames(NEInew) <-c("year", "Emissions")
NEInew <- aggregate(NEInew, by = list(year), FUN = sum)
colnames(NEInew) <-c("Year", "YearSum", "Emissions")
NEInew

png("Plot1.png", width=480, height=480)
plot(NEInew$Year,NEInew$Emissions,
     xlab="Year",
     ylab="Total Emissions",
     type = "l")