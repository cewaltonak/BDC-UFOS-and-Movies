# AUTHOR: JAEWOON IHN
# DATE CREATED: 2018-12-04

# === OVERVIEW ================================================================

R.version.string
#  "R version 3.5.1 (2018-07-02)"

# - PROJECT INFORMATION
# - LIBRARIES & SOURCES
# - FOLDER MANAGEMENT 


# === PROJECT INFORMATION =====================================================

# [QUESTION]
# Find out how well the maximum temperature and precipitation varies from west 
# to east across the Coast Mountains. Mountain ranges strongly influence 
# rainfall but how does it affect max temperature? Is the pattern the same?

# Weather stations to examine: 
# Vancouver, Squamish, Pemberton, Lillooet


# === LIBRARIES & SOURCES  ====================================================

install.packages("weathercan")
install.packages("devtools")
devtools::install_github("ropensci/weathercan")

library("weathercan")
library("devtools")
library(nlme)

# === FOLDER MANAGEMENT =======================================================

# Making sure working directory is what we expect
working.dir <- getwd()
setwd(working.dir)

# Make directories of certain names 
output.folder.names <- c("figures", "raw.data","clean.data")
# and make the folders if they don't exit yet. 
for(i in 1:length(output.folder.names)){
  if(file.exists(output.folder.names[i]) == FALSE) 
    dir.create(output.folder.names[i])
}



# Making path objects for each directory
for(i in 1:length(output.folder.names)){
  assign(paste("path", output.folder.names[i], sep="."),
         paste(working.dir, output.folder.names[i], sep = "/"))
}


