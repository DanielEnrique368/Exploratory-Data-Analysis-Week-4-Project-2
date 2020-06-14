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

# Comparing Baltimore(24510) and Los Angeles(06037) for type = ON-ROAD
Baltimore_vehi_emm <- summarise(group_by(subset(NEI_dat, NEI_dat$fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
Califoria_vehi_emm <- summarise(group_by(subset(NEI_dat, NEI_dat$fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))

Baltimore_vehi_emm$County <- "Baltimore City, MD"
Califoria_vehi_emm$County <- "Los Angeles County, CA"

Comparation_Emissions_bal.cal <- rbind(Baltimore_vehi_emm, Califoria_vehi_emm)

# graphic
ggplot(Comparation_Emissions_bal.cal, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,0))) +  geom_bar(stat="identity") + facet_grid(County~., scales="free") +  ylab(expression("total PM"[2.5]*" emissions in tons")) + xlab("year") +  ggtitle(expression("Baltimore City vs Los Angeles County Motor vehicle emission in tons"))+ geom_label(aes(fill = County) )

# save the graph with name "Plot6.pgn"
dev.copy(png, file = "Plot6.png", height = 480, width = 480)
dev.off()
