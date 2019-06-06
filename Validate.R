##### VALIDATION


# Environmental Data
### Aspect
summary(asp_yam)
which(asp_yam<0) # check for consistency with aspect values (should be within 0-360)

asp_yam <- aspect_yam %>%
  filter(VALUE>-1) # load in the relevant data only

asp_yam <- asp_yam$VALUE
min(asp_yam) # check for consistency with aspect values ( should be within 0-360)
max(asp_yam) # check for consistency with aspect values
str(asp_yam)

###  Slope values
# check that the values look reasonable. Is Z factor documented ???
sl_yam <- slope_yam$VALUE
str(sl_yam)

### Elevation
el_yam <- elev_yam$VALUE
summary(el_yam)
which(is.na(el_yam))

## Inspect descriptive statistics
summary(el_yam)
summary(sl_yam)
summary(asp_yam)


####### Archaeological data

# extracted from ASTER
which(yamast_mnd$prYamAspec<0)  # 859 out of 874 values have positive aspect 
which(yamast_mnd$prYamSlope>10) # just a sanity check, there should not be many values

# extracted from SRTM
which(yamsr_mnd$prYamASPEC<0)  # 873 out of 874 srtm values have positive aspect
which(yamsr_mnd$prYamSLOPE>9.0)

