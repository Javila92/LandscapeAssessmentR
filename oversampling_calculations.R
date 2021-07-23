###############################################################################
######################## Oversampling Muaro Jambi #############################
###############################################################################
library(data.table)
library(tidyverse)
library(dplyr)
library(stringr)


C07hh2018_3regencies <- filter(C07hh_list,  rid == "Muaro Jambi"| 
                                            rid == "Sarolangun" |
                                            rid == "Batanghari" )

# import LA households table 
LA_households_C07 <- filter(LA_household_list,  `Regency ID` == "Muaro Jambi"| 
                                                `Regency ID` == "Sarolangun" |
                                                `Regency ID` == "Batanghari" )
LA_households_C07 <- LA_households_C07 %>% filter(str_detect(`Household ID`, "Z01", negate = T))


table(LA_households_C07$`Regency ID`)
table(C07hh2018_3regencies$rid)


# basic calculation result:

LA_sample_shares <- NA

for (i in 1:3) {
  LA_sample_shares[[i]] <- c(table(LA_households_C07$`Regency ID`)[[i]] /
                                table(C07hh2018_3regencies$rid)[[i]])
}

print(LA_sample_shares)

# shares around 0.5
# 119/2 == 59.5 
# --> 52 more observations from Muaro Jambi required 

C07hh2018_Mjambi %>% filter( rid == "Muaro Jambi" )

table(C07hh2018_Mjambi$vid)

#### randomly select observations from the C07 sample

# 
SungaiDayo_HHIDs <- C07hh_list %>% filter( ph1_1 == "Sungai Dayo")
SungaiDayo_HHIDs <- SungaiDayo_HHIDs %>% pull(hid)

set.seed(1)
sample(SungaiDayo_HHIDs, size = 4, replace = F)






