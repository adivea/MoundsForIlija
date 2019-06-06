######    Processing Mound and Elevation Data for Yambol for Ilija Festschrift
######    Assessing frequency and representation in elevation bands


# Work inspired by Kuna for Bulgaria

# Libraries
library(tidyverse)

##### YAMBOL ENVIRONMENT


# I am on EU computer with US generated GIS file, so need to use read.table()

### Values extracted from ASTER terrain model 

# Yambol ASTER Elevation
elev_yam <- read.table("./data_mqns/prYAMAST_elev.csv", sep=";", dec=".", header = TRUE) # had to convert all numbers to integers in csv
str(elev_yam$VALUE)

# Yambol ASTER Slope
slope_yam <- read.table("./data_mqns/prYAMAST_slope.csv", sep=";", dec=".", header = TRUE)
str(slope_yam$VALUE)

# Yambol ASTER Aspect
aspect_yam <- read.table("./data_mqns/prYAMAST_aspect.csv", sep=";", dec=".", header = TRUE)
str(aspect_yam$VALUE)

## Values extracted from SRTM (projected) for Yambol boundary
# Elevation
elev_srtm <- read.table("./data_mqns/prYamSRTMelev.csv", sep=";", dec=".", header = TRUE) # had to convert all numbers to integers in csv
head(elev_srtm)
e_srtm <- as.numeric(elev_srtm$VALUE)
e_srtm

# Slope
slope_srtm <- read.table("./data_mqns/prYamSRTMslope.csv", sep=";", dec=".", header = TRUE)
head(slope_srtm)
sl_srtm <- slope_srtm$VALUE
which(sl_srtm<0)
summary(sl_srtm)

# Aspect
aspect_srtm <- read.table("./data_mqns/prYamSRTMaspect.csv", sep=";", dec=".", header = TRUE)
as_srtm <- aspect_srtm$VALUE[aspect_srtm$VALUE>-1]
summary(as_srtm)

# check and reshape the data to be numeric if need be
head(elev_yam)
str(aspect_yam$VALUE)


###### ARCHAEOLOGICAL DATA

### INGEST VERIFIED MOUND ENVIRO DATA

## 2009-2010, 2017, 2018 mound and extinct mound environmental data extraction; 
# ASTER
yamast_mnd <- read_csv("data_mqns/VerifiedAST_elapsl.csv")
yamast_mnd # 874 x 3 values

summary(yamast_mnd)

# SRTM
yamsr_mnd <- read_csv("data_mqns/VerifiedSRTM_elapsl.csv")
yamsr_mnd

summary(yamsr_mnd)


