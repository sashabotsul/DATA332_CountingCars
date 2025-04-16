# DATA332 Counting Cars
<p> Contributors: Logan Farley, Tanner Buol, Sasha Botsul</p>

### This page analyzes the results of our collected car data. 

---
## Data Collection
- We decided to collect our data in an Excel sheet. We each collected our data on different days, during different times.
- Our collected data consisted of the initial read, final read, difference in readings, date and time of the day recorded, type of car, whether or not it was a commercial vehicle, state registered, weather, location, and name of the recorder for tracking records.
- We all went to the same location, the speedometer sign near the Thorson-Lucken Field.
- To complete the assignment, we met up to all work on it together. 

## Data Cleaning
1.  We removed the location and name of recorder column for our dataset.
```
dataset <- dataset[1:9]
```
2. While recording, we numbered the car types for easier collection.
   - We converted the numbered list into the type of car.
```
car_types <- c(
  "1" = "Emergency",
  "2" = "Hatchback",
  "3" = "Sedan",
  "4" = "SUV",
  "5" = "Van",
  "6" = "Minivan",
  "7" = "Motorcycle",
  "8" = "Coupe",
  "9" = "Truck",
  "10" = "Pickup Truck"
)

dataset$Type_of_Car <- car_types[as.character(dataset$Type_of_Car)]
```

---


