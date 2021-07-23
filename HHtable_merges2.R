# Households needed for plot related questions
library(readxl)

LA_PlotInfo_households <- merge(Plot_identification_list, X20210606_PlotOwnerInfo,
                                by = "Owner_ID", all.x = T )

write.xlsx(LA_PlotInfo_households, "LA_HHforPlotInfoSurvey.xlsx")
