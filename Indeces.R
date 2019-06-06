###  Calculate Mound Location index in relief

Elev_freq
Slope_freq
str(Aspect_freq)

# Elevation 
print("Creating an index of elevation frequencies for mounds")
ElevationResult <- Elev_freq %>% 
  mutate(AsterArea_km=YamAster*(0.027^2), 
         YamPercent=YamAster/sum(YamAster), 
         MoundsExpected=sum(Mounds)*YamPercent,
         MoundIndex=Mounds/MoundsExpected) %>% 
  mutate(SRTMArea_km=YamSRTM*(0.08^2), 
         SRTMPercent=YamSRTM/sum(YamSRTM), 
         Expected=sum(MoundSRTM)*SRTMPercent,
         SRTMIndex=MoundSRTM/Expected) %>% 
  mutate_at(6:13,round,2) %>% 
  select(c(1,6,3,8:10,5,12,13 ))

print("Printing ElevationResult to file.")
write.csv(ElevationResult,"output_data/ElevationIndeces.csv")

# Slope 
print("Creating an index of slope frequencies for mounds")

SlopeResult <- Slope_freq %>% 
  mutate(AsterArea_km=YamAster*(0.027^2), 
         YamPercent=YamAster/sum(YamAster), 
         MoundsExpected=sum(Mounds)*YamPercent,
         MoundIndex=Mounds/MoundsExpected) %>% 
  mutate(SRTMArea_km=YamSRTM*(0.08^2), 
         SRTMPercent=YamSRTM/sum(YamSRTM), 
         Expected=sum(MoundSRTM)*SRTMPercent,
         SRTMIndex=MoundSRTM/Expected) %>%
  mutate_at(6:13,round,2) %>% 
  select(c(1,6,3,8:10,5,12,13))

print("Printing Slope Result to file.")
write.csv(SlopeResult,"output_data/SlopeIndeces.csv")

# Aspect 
print("Creating an index of aspect frequencies for mounds")

Aspect_freq
Aspect <- c("North(315-45)" , "East(45-135)", "South(135-225)", "West(225-315")

Aspect_final <- Aspect_freq %>%
  select(2:5) %>% 
  rbind(Aspect_freq[1,2:5] + Aspect_freq[5,2:5]) %>%   # adding row 1 and 4 as they are each half of North azimuth
  slice(c(6,2:4)) %>%  # drop rows 1 and 4 and replace by new row 6 for North
  cbind(Aspect) # add labels
Aspect_final
  
AspectResult <- Aspect_final %>% 
  mutate(AsterArea_km=YamAster*(0.027^2), 
         YamPercent=YamAster/sum(YamAster), 
         MoundsExpected=sum(Mounds)*YamPercent,
         MoundIndex=Mounds/MoundsExpected) %>% 
  mutate(SRTMArea_km=YamSRTM*(0.08^2), 
         SRTMPercent=YamSRTM/sum(YamSRTM), 
         Expected=sum(MoundSRTM)*SRTMPercent,
         SRTMIndex=MoundSRTM/Expected) %>%
  mutate_at(6:13,round,2)%>% 
  select(c(5,6,2,8:10,5,12,13))


print("Printing Aspect Result to file.")
write.csv(AspectResult,"output_data/AspectIndeces.csv")
print("Calculation completed; Check Output_data folder for results")