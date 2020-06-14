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
# Plot 3
######################

# created a subsection to save the Baltimore, Maryland emissions data (fips == “24510”) from 1999 to 2008
Baltimore.dat <-subset(NEI_dat,fips=="24510")
View(emission_years)

# adding Baltimore NEI emissions by year and type
Baltimore_years_type <- aggregate(Emissions ~ year+ type, Baltimore.dat, sum)
View(Baltimore_years_type)

# graphic
Graf.3 <- ggplot(Baltimore_years_type, aes(year, Emissions, color = type))
Graf.3 <- Graf.3 + geom_line() +  xlab("year") +  ylab(expression('Total Emissions')) +  ggtitle(expression(paste("Total Baltimore Emissions " , PM[2.5],"From 1999 to 2008 ")))
print(Graf.3)

# save the graph with name "Plot3.pgn"
dev.copy(png, file = "Plot3.png", height = 480, width = 480)
dev.off()

