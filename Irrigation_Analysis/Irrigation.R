# Irrigation Analysis
# Haifaa

library(tidyverse)
irrigation <- read_csv("Irrigation_Analysis/Data/irrigation_wide.csv")

view(irrigation)
str(irrigation)
glimpse(irrigation)
summary(irrigation)

# make it Tidy ....
irrigation_t <- irrigation %>%
  pivot_longer(-(year), 
               names_to = "region", 
               values_to = "value")#longer not necessrly be tidy

#irrigation_long
irrigation
# EDA
# in 2007 what is the total area under irrigation for 2 Americas? Easy, no need to tidy
irrigation %>%
  filter(year == 2007)  %>%
  select(c(4,5))  %>% #or select("","")
  sum()

# total area under irrigation in each year?
irrigation_t %>%
  group_by(year) %>%
  summarise(total = sum(value)) 

# Standardize against 1980 (relative change over 1980) Easier
irrigation_t %>% 
  group_by(region) %>% 
  summarise(diff = value[year==2007] - value[year==1980])

#which region increased the most? 
irrigation_t %>% 
  group_by(region) %>% 
  summarise(diff = value[year==2007] - value[year==1980])%>%
  #filter(diff == max(diff))
  arrange(-diff)  %>% 
  slice(1:2)
#OR
#slice_max(diff, n =2)

#region[diff == max(diff)]
# rate-of-change in each region?
# lowest and highest? 
#plot area over 

