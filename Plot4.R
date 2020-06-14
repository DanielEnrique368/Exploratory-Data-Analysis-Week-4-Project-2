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
# Plot 4
######################

# aggregating NEI emmissions by year and type
emission_years_type <- aggregate(Emissions ~ year+ type, NEI_dat, sum)
View(emission_years_type)

# graphic
Graf <- ggplot(emission_years_type, aes(year, Emissions, fill= type))
Graf <- Graf +    xlab("year") +  ylab(expression('Total Emissions')) +  ggtitle('Total Baltimore Emissions [2.5]* From 1999 to 2008')

Graf.4 <- ggplot(emission_years_type, aes(factor(year), Emissions))
Graf.4 <- Graf + geom_bar(stat="identity") +  xlab("year") +  ylab(expression('Total Emissions')) + ggtitle(expression(paste("Total Emissions in EE.UU. " , PM[2.5],"From 1999 to 2008 ")))

print(Graf.4)

# save the graph with name "Plot4.pgn"
dev.copy(png, file = "Plot4.png", height = 480, width = 480)
dev.off()
