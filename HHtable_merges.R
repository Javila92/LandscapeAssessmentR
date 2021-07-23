library(data.table)
library(tidyverse)
library(openxlsx)

Landscape_assessment <- as.data.table(Landscape_assessment)
PlotOwners_04062021 <- as.data.table(PlotOwners_04062021)
merge(Landscape_assessment, PlotOwners_04062021, by = "Owner_ID",
      all.x = T)

LA_plots_info <- as_tibble(merge(Landscape_assessment, PlotOwners_04062021, by = "Owner_ID",
                                 all.x = T))

LA_plots_info <- subset(LA_plots_info, select = c("Owner_ID", "Plot_ID"))

write.xlsx(LA_plots_info, "LA_PlotOwnerID.xlsx")

length(table(LA_plots_info$Owner_ID) == 2)



