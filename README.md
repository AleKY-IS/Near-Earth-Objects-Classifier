# Near Earth Objects Classifier

Our solution uses Machine Learning model to detect potentially hazardous NEOs (Near Earth Objects) from its orbital data. It also helps in visualizing hot spots on world map where Fireballs and Meteorites appeared. Finally we extracted some interesting insights out of our datasets.

The solution can be seen as 3 main tracks:

_ Classification _
	Our solution provides a classification model that takes the orbit's parameters as an input of a NEO and classify it as potentially hazardous or not.

_ Visualization _
	Displaying distribution of potentially hazardous objects on the world map to visualize the severity of different areas.


_ Insights _
	Our solution reveals hidden information from



_ In Classifier Folder _
isPha.py : has the random forest

_ In Data Folder _

1) Meteorite_Landings.csv : Meteorite that have hit the earth

2) from this [link](http://ssd.jpl.nasa.gov/sbdb_query.cgi#x) we managed to extract all asteroids and comets data.

3) Meteorites_smallObj.csv :
data that h`ave a merge between the 2 files Meteorite_Landings.csv and the one generated from the previous link
exploiting the fact that there is a common field between the 2 datasets, which is the name of the object.
The data represent the metr?? before hitting the earth that have eventually turned into meteroites.

4) NEA_labeled.csv
This file has the information about the orbit of each object, this fils is used by the classifier.

## Simple presentation

* [Presentation](https://prezi.com/uf55upuhqw0f/near-earth-objects/?utm_campaign=share&utm_medium=copy) 