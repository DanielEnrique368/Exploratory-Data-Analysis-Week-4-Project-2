# Download the packages required to read the data and to make the graphics

library(dplyr)
library(bindrcpp)
library(ggplot2)

# modify the directory address with the code 'setwd'.
setwd("C:/Users/DANIEL/Documents/GitHub/Exploratory-Data-Analysis-Week-4-Project-2")

# reading and exploring NEI data - National Emmissions Data
NEI_dat <- readRDS("summarySCC_PM25.rds")

# reading and exploring SCC data - Source Classification Code Data
SCC_dat <- readRDS("Source_Classification_Code.rds")

######################
# Plot 5
######################

# subset data from Baltimore City from type "on road"
Baltimore_Car_Dat <- subset(NEI_dat, NEI_dat$fips=="24510"  & NEI_dat$type=="ON-ROAD")
Baltimore_Car_Year <- aggregate(Baltimore_Car_Dat$Emissions, by=list(Baltimore_Car_Dat$year), FUN=sum)
colnames(Baltimore_Car_Year) <- c("Year", "Emissions")

# create plot showing car related emissions in Baltimore City from 1999-2008
plot(Baltimore_Car_Year$Year, Baltimore_Car_Year$Emissions,type = "o", xlab = "year", ylab = "Total Emissions (tons)", main = "Total Emissions of PM related to motor Vehicles", sub = "Baltimore City")

# save the graph with name "Plot5.pgn"
dev.copy(png, file = "Plot5.png", height = 480, width = 480)
dev.off()



