install.packages("tidyverse")
library(tidyverse)
################################################
################################################
input_filepath <- "C:\\" ## input the location of file# 
output_filepath <- "C:\\" ## input the location of file# 
dt <- read.table(input_filepath, sep="\t", 
                 header=T, check.names=F, stringsAsFactors=FALSE, quote = "")

dt_split <- separate_rows(dt, `Protein group IDs`, sep=";")

dt_split_intensities <- dt_split %>% group_by(`Protein group IDs`) %>% 
  summarise_at(vars(matches('Reporter intensity corrected.')), list(sum = sum), na.rm=TRUE)
dt_split_remaining <- dt_split %>% group_by(`Protein group IDs`) %>% 
  summarise_at(vars(!matches('Reporter intensity corrected.')), list(~paste(unique(.), collapse=";")))
dt_protGroups <- reduce(list(dt_split_intensities, dt_split_remaining), left_join, by = c("Protein group IDs")) 
write.table(dt_protGroups, file=output_filepath, 
            quote=FALSE, sep='\t', col.names=T, row.names=F)
################################################
################################################