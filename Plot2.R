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
# Plot 2
######################

# created a subsection to save the Baltimore, Maryland emissions data (fips == “24510”) from 1999 to 2008
Baltimore.dat <-subset(NEI_dat,fips=="24510")
View(emission_years)

# adding Baltimore NEI emissions per year
Baltimore_years <- aggregate(Emissions ~ year, Baltimore.dat, sum)
View(Baltimore_years)

# graphic
barplot(height=Baltimore_years$Emissions/1000, names.arg=Baltimore_years$year, xlab="Year", ylab=expression('Aggregated Emission'),main=expression('Baltimore Aggregated PM'[2.5]*' Emmissions by Year'))

# save the graph with name "Plot2.pgn"
dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()



