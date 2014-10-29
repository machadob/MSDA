#install.packages("rmongodb")
library(rmongodb)
#Connect to the mongodb database at the default host and port.
mongo <- mongo.create()
#Check if the connection is good.
if (mongo.is.connected(mongo) == TRUE) {
  db <- "unitedstates"
  # Get all the collection in the unitedstates database. In this case only one collection.
  col<-mongo.get.database.collections(mongo, db)
  # Get all the records in the collection.
  records<-mongo.find(mongo, col)
}

# Below are counters for each file. This counter will be used to store the 
# individual columns in list before converting the lists to a dataframe.
stateCounter = 0
districtCounter = 0
territoryCounter = 0

# Note: Instead of hardcoding the number of records in each file, I could have read each
# file and found out the number of records. I did not do this to reduce complexity.
numberOfStates = 50
numberOfDistricts = 1
numberOfTerritories = 5

#Below are empty vectors to store the data for states. These will be filled up using
# a cursor and then converted into a data frame. 
state = vector("character",numberOfStates)
abbr = vector("character",numberOfStates)
capital_city = vector("character",numberOfStates)
largest_city = vector("character",numberOfStates)
population = vector("numeric",numberOfStates)
area_sq_miles = vector("numeric",numberOfStates)
land_area_sq_miles = vector("numeric",numberOfStates)
house_seats = vector("numeric",numberOfStates)
statehood_date_temp = vector("character",numberOfStates)

#Below are empty vectors to store the data for districts. These will be filled up using
# a cursor and then converted into a data frame.
federal_district = vector("character",numberOfDistricts)
abbr_district = vector("character",numberOfDistricts)
establishment_date_temp = vector("character",numberOfDistricts)
population_district = vector("numeric",numberOfDistricts)
area_sq_miles_district = vector("numeric",numberOfDistricts)
land_area_sq_miles_district = vector("numeric",numberOfDistricts)
house_seats_district = vector("numeric",numberOfDistricts)

#Below are empty vectors to store the data for territories. These will be filled up using
# a cursor and then converted into a data frame.
territory = vector("character",numberOfTerritories)
abbr_territory = vector("character",numberOfTerritories)
capital = vector("character",numberOfTerritories)
acquisition_year = vector("numeric",numberOfTerritories)
territorial_status = vector("character",numberOfTerritories)
population_territory = vector("numeric",numberOfTerritories)
area_sq_miles_territory = vector("numeric",numberOfTerritories)
land_area_sq_miles_territory = vector("numeric",numberOfTerritories)
house_seats_territory = vector("numeric",numberOfTerritories)

# Go through the collection with the help of a cursor.
while (mongo.cursor.next(records)) {
  cval = mongo.cursor.value(records)
  #If 
  if(!is.null(mongo.bson.value(cval,"territory")) ) {
    territoryCounter = territoryCounter + 1
    territory[territoryCounter]  = mongo.bson.value(cval,"territory")
    abbr_territory[territoryCounter]  = mongo.bson.value(cval,"abbr")
    capital[territoryCounter]  = mongo.bson.value(cval,"capital")
    acquisition_year[territoryCounter]  = mongo.bson.value(cval,"acquisition_year")
    #Clean up the quotes in the data. could have done this for all feilds but limited it only
    #to feilds that were found to need some cleaning.
    territorial_status[territoryCounter]  = gsub("\"", "", mongo.bson.value(cval,"territorial_status"))
    population_territory[territoryCounter]  = mongo.bson.value(cval,"population")
    area_sq_miles_territory[territoryCounter]  = mongo.bson.value(cval,"area_sq_miles")
    land_area_sq_miles_territory[territoryCounter]  = mongo.bson.value(cval,"land_area_sq_miles")
    house_seats_territory[territoryCounter]  = mongo.bson.value(cval,"house_seats")
    
  }else if(!is.null(mongo.bson.value(cval,"federal_district")) ) {
    districtCounter = districtCounter + 1
    #Clean up the quotes in the data.
    federal_district[districtCounter]  = gsub("\"", "", mongo.bson.value(cval,"federal_district"))
    abbr_district[districtCounter]  = mongo.bson.value(cval,"abbr")
    establishment_date_temp[districtCounter]  = mongo.bson.value(cval,"establishment_date")
    population_district[districtCounter]  = mongo.bson.value(cval,"population")
    area_sq_miles_district[districtCounter]  = mongo.bson.value(cval,"area_sq_miles")
    land_area_sq_miles_district[districtCounter]  = mongo.bson.value(cval,"land_area_sq_miles")
    house_seats_district[districtCounter]  = mongo.bson.value(cval,"house_seats")    
    
  }else {
    stateCounter = stateCounter + 1
    state[stateCounter] = mongo.bson.value(cval,"state")
    abbr[stateCounter] = mongo.bson.value(cval,"abbr")
    capital_city[stateCounter] = mongo.bson.value(cval,"capital_city")
    largest_city[stateCounter] = mongo.bson.value(cval,"largest_city")
    population[stateCounter] = mongo.bson.value(cval,"population")
    area_sq_miles[stateCounter] = mongo.bson.value(cval,"area_sq_miles")
    land_area_sq_miles[stateCounter] = mongo.bson.value(cval,"land_area_sq_miles")
    house_seats[stateCounter] = mongo.bson.value(cval,"house_seats")
    statehood_date_temp[stateCounter] = mongo.bson.value(cval,"statehood_date")
    
  }
}
# Convert the dates from characters to Date type.
statehood_date = as.Date(statehood_date_temp, '%m/%d/%Y')
establishment_date = as.Date(establishment_date_temp, '%m/%d/%Y')

# Construct data frames from the list created above.
df_states = as.data.frame(list(state=state, abbr=abbr, capital_city=capital_city, largest_city=largest_city, population=population, area_sq_miles=area_sq_miles, land_area_sq_miles=land_area_sq_miles, house_seats=house_seats, statehood_date=statehood_date))
df_federal = as.data.frame(list(federal_district=federal_district, abbr=abbr_district, establishment_date=establishment_date, population=population_district, area_sq_miles=area_sq_miles_district, land_area_sq_miles=land_area_sq_miles_district, house_seats=house_seats_district))
df_territory = as.data.frame(list(territory=territory, abbr=abbr_territory, capital=capital, acquisition_year=acquisition_year, territorial_status=territorial_status, population=population_territory, area_sq_miles=area_sq_miles_territory, land_area_sq_miles=land_area_sq_miles_territory, house_seats=house_seats_territory))

# Display the first few records from the data frames.
head(df_states)
head(df_federal)
head(df_territory)