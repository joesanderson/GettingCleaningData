# Run_analysis.R

## Background
R script for extracting, merging and tidying dataset of accelerometer-derived measurements

## Process
- Loads required datasets into memory
- Combines measurements from training/test datasets using `rbind`
- Also combines activity labels using `rbind`
- Renames column headings using list from features.txt file
- Labels each observation using `cbind`
- Extracts required variables (i.e. those with 'mean' or 'std' at the end of their name) using regex `grepl`
- Uses `inner_join` to insert a new column of descriptive activity labels, and reorders the columns
- Finally, uses `group_by` to group the results by activity, and `summarise_each` to generate a summarised dataset with each variable

## Comments
- Both datasets generated are now *tidy*, in that each column contains a single variable, and each row refers to a single observation
- To examine the uploaded dataset, load it into R using ```read.table("output.txt",header=TRUE)```
