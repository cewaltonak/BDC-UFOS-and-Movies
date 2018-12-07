#---===BIG D CHALLENGE: UFOs and Movies===---

# retroactively install Tidyverse so I can mess with the movie list later
install.packages("tidyverse")
# turns out might not be necessary, but will keep just in case

# check the library's contents
library(tidyverse)

#acivate {dplyr} so I can finally order this list
library(dplyr)

# make sure the working directory is where it needs to be
getwd()

# assign working directory to object "w.dir"
w.dir <- getwd()

output.folder.names <- c(
  "raw data",
  "clean data",
  "cleaners",
  "analyzers",
  "figures"
)

# double check length and strucure of folder names vector
length(output.folder.names)
str(output.folder.names)

# for-loop to build folders saved in output.folder.names, will run until all folders are built
for(i in 1:length(output.folder.names)) {
  if(file.exists(output.folder.names[i]) == FALSE)
    dir.create(output.folder.names[i])
}

# check that the new files are where they should be
list.files()

# build file paths for new files
# paste pulls all elements in () together; 
#     working directory + "/" + assigned folder name[number of folder in sequence] (DO NOT FORGET THE SLASHES)
p.rawdata <- paste(w.dir, (output.folder.names[1]), sep = "/")
p.cleandata <- paste(w.dir, (output.folder.names[2]), sep ="/")
p.cleaners <- paste(w.dir, (output.folder.names[3]), sep ="/")
p.analyzers <- paste(w.dir, (output.folder.names[4]), sep ="/")
p.figures <- paste(w.dir, (output.folder.names[5]), sep ="/")

# check the csv to make sure it's pathed properly
# also: f*** typing this out; drag and drop the file and delete everything left of the hard drive directory
read.csv("C:/Users/Christopher Walton/Documents/Quest/IND 3157 (Data Analysis Using R)/code book/BDC_UFOs_Movies/raw data/consolidated_weather_V03.csv")

# assign csv to new data frame designation
UFO.sightings <- read.csv("C:/Users/Christopher Walton/Documents/Quest/IND 3157 (Data Analysis Using R)/code book/BDC_UFOs_Movies/raw data/consolidated_weather_V03.csv")

# second verse same as the first for the movie metadata
read.csv("C:/Users/Christopher Walton/Documents/Quest/IND 3157 (Data Analysis Using R)/code book/BDC_UFOs_Movies/raw data/movies_metadata.csv")

# second verse, continued
movie.data <- read.csv("C:/Users/Christopher Walton/Documents/Quest/IND 3157 (Data Analysis Using R)/code book/BDC_UFOs_Movies/raw data/movies_metadata.csv")

# double-check column names and structure to make sure this is still a dataframe
colnames(movie.data)
str(movie.data)

# isolate the 2 columns needed: movie titles and release dates
movie.titles.releases <- movie.data[c("title", "release_date")]

# write the new abridged list to the raw data folder
write.csv(movie.titles.releases, paste(p.rawdata, "movie.titles.releases.csv", sep ="/"))

# check length and structure of movies.titles.releases, make sure it's a data frame of two columns
length(movie.titles.releases)
str(movie.titles.releases)

# check to make sure the column lengths match - lo and behold they do!
length(movie.titles.releases$title)
length(movie.titles.releases$release_date)

# reorganize list so that dates are in YYYY/MM/DD format, and listed in chronological order

movie.titles.releases$release_date

dates.ordered <- c("1997-1-1", "2019-1-1") # turned out to be unnecessary

# movie.list <- movie.titles.releases(start = dates[1], end = dates[2]) #doesn't read a dataframe as a function; need to find actual function

#how to reshuffle dataframe by date; need function to perform (FIXED BELOW)
?arrange
??arrange
# NAILED IT! Reordered the movie list by release date
arrange(movie.titles.releases, release_date)

# assign new order to variable "movie.list"
movie.list <- arrange(movie.titles.releases, release_date)

write.csv(movie.list, paste(p.cleandata, "Movies_by_release.csv", sep="/"), row.names = FALSE)

# needs release date column turned into dates, everything earlier than 1997-1-1 removed

#movie.list.1997 <- 
