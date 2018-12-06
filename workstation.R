# BIG DATA CHALLENGE
# GROUP 2
# JAEWOON IHN 

# first, let us download the ufo sighting and weather data
data.ufo.sighting.w.weather <- read.csv("consolidated_weather_V03.csv")

# we are not interested in the weather data, so let us clip it out.

colnames(data.ufo.sighting.w.weather)
str(data.ufo.sighting.w.weather)

# the columns that we want to keep are: state, city, colour, shape, mday, 
# month, year, hour, id. 

# We make a list of names 
c("state", "city", "colour", "shape", "mday", "month", "year", "hour", "id")

# and only select from the raw data set the part of the data set that we are
# interested in 
data.ufo.sighting.w.weather[c("state", "city", "colour", "shape", "mday", "month", "year", "hour", "id")]

