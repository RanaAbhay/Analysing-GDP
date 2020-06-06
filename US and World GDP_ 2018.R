library(readxl)
library(dplyr)
library(maps)
library(tidyr)
library(ggplot2)

# Setting scientific notations off
options(scipen = 999)

# Setting working directory
setwd("C:/Users/RanaA/Desktop/Coursera")

# Reading myGDP data
myGDP <- read.csv("myGDP.csv",header = TRUE,stringsAsFactors = FALSE)
names(myGDP)[2] <- "region"
myGDP <- myGDP %>% transform(region=tolower(region))

# Putting categories for GPDs

Cat <- c("Over $10 trillion","$3 trillion - $5 trillion","$1 trillion - $3 trillion","$500 billion - $1 trillion","$100 billion - $500 billion","less than $100 billion")

myOverTenTrillion <- myGDP %>% filter(GDP..USD.million.> 10000000)
myOverTenTrillion <- myOverTenTrillion %>% mutate(Category=Cat[1])

myThreeToTenTrillion <- myGDP %>% filter(GDP..USD.million.>= 3000000 & GDP..USD.million. <= 10000000)
myThreeToTenTrillion <- myThreeToTenTrillion %>% mutate(Category=Cat[2])

myOneToThreeTrillion <- myGDP %>% filter(GDP..USD.million.>= 1000000 & GDP..USD.million. <= 3000000)
myOneToThreeTrillion <- myOneToThreeTrillion %>% mutate(Category=Cat[3])

myFivehToOneTrillion <- myGDP %>% filter(GDP..USD.million.>= 500000 & GDP..USD.million. <= 1000000)
myFivehToOneTrillion <- myFivehToOneTrillion %>% mutate(Category=Cat[4])

myOnehToFiveh <- myGDP %>% filter(GDP..USD.million.>= 100000 & GDP..USD.million. <= 500000)
myOnehToFiveh <- myOnehToFiveh %>% mutate(Category=Cat[5])

myLessThanOneh <- myGDP %>% filter(GDP..USD.million. < 100000)
myLessThanOneh <- myLessThanOneh %>% mutate(Category=Cat[6])

myGDP <- rbind(myOverTenTrillion,myThreeToTenTrillion,myOneToThreeTrillion,myFivehToOneTrillion,myOnehToFiveh,myLessThanOneh)
myGDP <- myGDP %>% transform(Category=as.factor(Category))

# Retreiving world map data
mapWorld <- map_data("world")
mapWorld <- mapWorld %>% transform(region=tolower(region))

# Retreiving USA state map data
mapStates <- map_data("state")

# Combining mapWorld and mapStates data
map <- rbind(mapWorld,mapStates)

# PLotting GDP data
gg <- ggplot(data=myGDP,aes(fill=Category)) + 
      geom_map(aes(map_id=region),map=map, color="black") + 
      expand_limits(x=map$long,y=map$lat) + scale_fill_manual(name="Countries and US States by GDP (2018)",breaks = c("Over $10 trillion","$3 trillion - $5 trillion","$1 trillion - $3 trillion","$500 billion - $1 trillion","$100 billion - $500 billion","less than $100 billion"),values = c("Over $10 trillion"="darkgreen","$3 trillion - $5 trillion"="forestgreen","$1 trillion - $3 trillion"="aquamarine3","$500 billion - $1 trillion"="salmon2","$100 billion - $500 billion"="indianred3","less than $100 billion"="indianred4")) +
      theme(panel.background = element_rect(fill="skyblue"),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            axis.ticks = element_blank(),
            axis.text = element_blank(),
            axis.title = element_blank(),
            axis.title.x = element_text(face="bold",size=10,hjust = 0,vjust = 1)
            ) +
      labs(x="Countries and US states by Nominal GDP")

# Plotting
plot(gg)




