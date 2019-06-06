######    Master script to run frequency analysis on environmental data extracted from ASTER and SRTM 
######    relief at verified map mound locations. 
######
######    Analytical workflow behind chapter for Ilija Iliev's Festschrift in Yambol
######    6 June 2019
######    Work inspired by Kuna's 2006 article minus stream modelling

# Libraries
library(tidyverse)

# Set Workspace. Datasets are either in Projects> MQNS>Locational AnaysisMQNS6 or in RStudio
getwd()
# Choose whichever suits
# setwd("D:/Users/MQ20149304/Documents/Professional/Projects/MQNS/GIS/LocationalAnalysis")
# setwd("D:/Adela/RStudio/MoundsInLandscape")  


## Procedure: Read in values extracted from Aster projected and merged tiles
## for area covered Yambol regional boundary
## Datasets should be prefixed by pr_ as the Yambol rasters required projection. rasters are on external drive (Black GoFlex)
## Then read in data extracted from verified mound points
## contrast and compare with background via frequencies.


source("LoadData.R")
source("Frequencies.R")

Elev_freq
Slope_freq
Aspect_freq

source("Indeces.R")

ElevationResult
SlopeResult
AspectResult
