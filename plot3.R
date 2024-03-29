library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
TotalEmissions <- NEI %>% subset(fips == "24510") %>% group_by(type,year) %>% summarize(Em = sum(Emissions))
png("plot3.png")
g <- ggplot(TotalEmissions,aes(factor(year),Em)) + geom_bar(stat = "identity") + facet_grid(. ~ type)
g <- g + labs(x = "Year",y = "Total Emission (Tons)")
g
dev.off()