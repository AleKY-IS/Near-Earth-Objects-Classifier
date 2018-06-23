library(maps)
library(ggmap)
#read the input file
Data = read.csv(“/Data/Meteorite_Landings.csv") # adjust path to Data folder
mp <- NULL
#create the world map
mapWorld <- borders("world", colour="gray50", fill="white")
#plot the map
mp <- ggplot() +   mapWorld
#add a numeric representation of mass
Data$mass=as.numeric(as.character(Data$mass..g.));
#truncate the outliers
newData <- subset(Data, Data$mass<20000)
#add longitude on x-axis, latitude on y-axis and represent mass through color ranges from yellow to red
mp + geom_point(data = newData[complete.cases(newData[,5]),], aes(x = reclong, y = reclat, color = mass)) + scale_colour_gradient(low="yellow", high="red")+ xlab("Longitude") + ylab("Latitude")
