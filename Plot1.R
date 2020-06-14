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
# Plot 1
######################

# aggregating NEI emmissions by year
emission_years <- aggregate(Emissions ~ year, NEI_dat, sum)
View(emission_years)

# graphic
barplot(height=emission_years$Emissions/1000, names.arg=emission_years$year, xlab="Year", ylab=expression('Aggregated Emission'),main=expression('Aggregated PM'[2.5]*' Emmissions by Year'))

# save the graph with name "Plot1.pgn"
dev.copy(png, file = "Plot1.png", height = 480, width = 480)
dev.off()








