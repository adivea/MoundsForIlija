 # Locational Analysis of Mounds in the Yambol province

A script for the processing of environmental data extracted from DEM for burial mound locations indicated in the Soviet topographic maps for the Yambol province, SE Bulgaria. Only locations verified through 2010-2018 surface 
survey were used for this study(see VerifiedMounds.csv for the visited features).
Frequency tables are calculated for individual environmental zones in the rasters (ASTER , SRTM) and for mound locations. 
The environmental data used as input was generated through point sampling and raster value extraction to table in QGIS/ArcGIS 

To run this code, run the MQNS.R master file. 
Beware: you will need the data_mqns folder with environmental data from GIS, which you may require use the git lfs package if you are operating on a command line. You might also need to edit the .gitignore file.
