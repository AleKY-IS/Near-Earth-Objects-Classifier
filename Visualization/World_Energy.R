#load essential libraries for maps and plotting
library(maps)
library(ggmap)
#read input file
Data = read.csv(“/Data/fireballs.csv") # adjust path to Data folder
mp <- NULL
# create the world map
mapWorld <- borders("world", colour="gray50", fill="white")
#plot the map
mp <- ggplot() +   mapWorld
#add longitude on x-axis, latitude on y-axis and represent altitude through color ranges from yellow to red
mp + geom_point(data = Data[complete.cases(Data[,2:4]),], aes(x = Longitude..Deg., y = Latitude..Deg., color = Altitude..km.)) + scale_colour_gradient(low="red", high="yellow")+ xlab("Longitude") + ylab("Latitude")
