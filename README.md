# pSILAC-TMT-Rebuild-Script
R script that rebuilds the peptides from the evidence.txt file from MaxQuant to proteins
It does this by reading the evidence file into a Dataframe.
Expands the Dataframe based on protein Group IDs to get only one protein Group ID per row. 
Sums the intensity columns grouped by protein Group. 
Exports the final Dataframe with the summed intensities into a .txt file
From here the data can then be opened with Perseus to continue analysis. 
