library(stringr)
library(openxlsx)

C07hh_list$ph1_14_1 <- gsub("02.", "-2.", C07hh_list$ph1_14_1, fixed = T)
C07hh_list$ph1_14_1 <- gsub("01.", "-1.", C07hh_list$ph1_14_1, fixed = T)


# not working the proper way:
# C07hh_list$ph1_14_1 <- str_replace(C07hh_list$ph1_14_1, "02.", "-2.")
# C07hh_list$ph1_14_1 <- str_replace(C07hh_list$ph1_14_1, "01.", "-1.")

range(C07hh_list$ph1_14_1)

C07hh_list$ph1_14_1 == -2.13625
write.xlsx(C07hh_list, "C07hh_list_correctedGPS.xlsx")




