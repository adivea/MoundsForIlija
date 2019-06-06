#### Part 2 of Locational Analysis of Yambol mounds (documented in maps and verified) 
#### This bit takes loaded data for elevation, slope and aspect in raster and mounds,
#### bins them and calculates frequencies

## Prepare for binning
breaks <- c(100,200,300,400,500,600,700) # use for elevation
bins <- c(0,2,4,6,8,10,20,60) #for slope values
aspectbin <- c(0, 45, 135, 225, 315, 360)


#### Bins using cut() and dig.lab=number of numbers we don't want abbreviated

# ASTER Elevation
print("Calculating frequencies for ASTER elevation, slope and aspect data and binning them")

# have numeric value vector ready
is.na(elev_yam$VALUE)
e <- na.omit(elev_yam$VALUE)

tapply(e,cut(e,breaks),median)

elevbins_yam <- cut(e,breaks = breaks,dig.lab = 5) ## very important to make thousands appear not as scientific notations
df_yam_e <- data.frame(table(elevbins_yam))   # calculate frequency via table() and convert to dataframe for printing
df_yam_e


### ASTER slope
tapply(slope_yam$VALUE,cut(slope_yam$VALUE,breaks=bins),median)
(slopebin <- cut(slope_yam$VALUE,breaks=bins))
df_yam_sl <- data.frame(table(slopebin))
df_yam_sl


### ASTER aspect
#tapply(asp_yam,cut(asp_yam,breaks=aspectbin),median)
aspectbin_yam <- cut(aspect_yam$VALUE, breaks=aspectbin)
df_yam_asp <- data.frame(table(aspectbin_yam))
df_yam_asp


### ASTER Mound data 
elevbins_mnd <- cut(yamast_mnd$prYAMASTde,breaks=breaks,dig.lab=5)
df_mnd_e <- data.frame(table(elevbins_mnd))
df_mnd_e

slopebin_mnd <- cut(yamast_mnd$prYamSlope, breaks = bins)
(df_mnd_sl <- data.frame(table(slopebin_mnd)))

aspectbin_mnd <- cut(yamast_mnd$prYamAspec, breaks = aspectbin)
(df_mnd_as <- data.frame(table(aspectbin_mnd)))



##### SRTM Data
print("Calculating frequencies for SRTM elevation, slope and aspect data and binning them")
# Elevation
tapply(e_srtm,cut(e_srtm,breaks),median)
elevbins_srtm <- cut(e_srtm,breaks = breaks,dig.lab = 5) ## very important to make thousands appear not as scientific notations
df_srtm_e <- data.frame(table(elevbins_srtm))   # calculate frequency via table() and convert to dataframe for printing
df_srtm_e

# Slope
tapply(sl_srtm,cut(sl_srtm,breaks=bins),median)
(slopebin_srtm <- cut(sl_srtm,breaks=bins))
df_srtm_sl <- data.frame(table(slopebin_srtm))
df_srtm_sl  # values of slope in the SRTM dataset are flattenned compared to ASTER due to the coarse resolution

summary(sl_srtm)

# Aspect
tapply(as_srtm,cut(as_srtm,breaks=aspectbin),median)
aspectbin_srtm <- cut(as_srtm,breaks=aspectbin)
df_srtm_asp <- data.frame(table(aspectbin_srtm))
df_srtm_asp  # my expectation is for SRTM to match ASTER pretty well.

# SRTM Mound data 
elevbins_mnd2 <- cut(yamsr_mnd$prYamDEMsr,breaks=breaks,dig.lab=5)
df_mnd_e2 <- data.frame(table(elevbins_mnd))
df_mnd_e2

slopebin_mnd2 <- cut(yamsr_mnd$prYamSLOPE, breaks = bins)
(df_mnd_sl2 <- data.frame(table(slopebin_mnd2)))

aspectbin_mnd2 <- cut(yamsr_mnd$prYamASPEC, breaks = aspectbin)
(df_mnd_as2 <- data.frame(table(aspectbin_mnd2)))



#### COMBINE ASTER AND SRTM OUTPUTS INTO A SINGLE TABLE AND RELABEL
print("Combining outputs into tables")

## ELEVATION

Elev_freq <- cbind.data.frame(df_yam_e,df_mnd_e[,2], df_srtm_e[,2], df_mnd_e2[,2])
Elev_freq

colnames(Elev_freq) <-c("ElevationBins","YamAster","Mounds","YamSRTM","MoundSRTM")
head(Elev_freq)

## SLOPE

Slope_freq <- cbind.data.frame(df_yam_sl, df_mnd_sl[,2], df_srtm_sl[,2],df_mnd_sl2[,2])
Slope_freq
colnames(Slope_freq) <-c("SlopeBins(degrees)","YamAster","Mounds","YamSRTM","MoundSRTM")
head(Slope_freq)

## ASPECT

Aspect_freq <- cbind.data.frame(df_yam_asp, df_mnd_as[,2], df_srtm_asp[,2],df_mnd_as2[,2])
Aspect_freq
colnames(Aspect_freq) <-c("AspectBins(azimuth)","YamAster","Mounds","YamSRTM","MoundSRTM")
head(Aspect_freq)


#### WRITE RESULTS TO FILE
print("Writing results to file")

if(dir.exists("output_data/")) {
   print("Output directory detected. Carrying on...")} else {
   dir.create("output_data")
     }
  
write.csv(Elev_freq,"output_data/YamMapMndElevationFrequency.csv")
write.csv(Slope_freq,"output_data/YamMapMndSlopeFrequency.csv")
write.csv(Aspect_freq,"output_data/YamMapMndAspectFrequency.csv")

print("All done with Frequency calculations. Use the Indeces.R script to generate locational mound indeces")

