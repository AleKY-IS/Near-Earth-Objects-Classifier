library("rworldmap")
#read input file
meteorite <- read.table(“/Data/Meteorite_Landings.csv",header=TRUE,sep=",") # adjust path to Data folder
#create map of the world
newmap <- getMap(resolution = "low")
#plot the map
plot(newmap)
#add longitude on the x-axis, latitude on the y-axis and represent the "Fell" tagged points in red, and the "Found" in blue
points(subset(meteorite, fall=="Fell")$reclong, subset(meteorite, fall=="Fell")$reclat, col = "red", cex = .6)
points(subset(meteorite, fall=="Found")$reclong, subset(meteorite, fall=="Found")$reclat, col = "blue", cex = .6)
