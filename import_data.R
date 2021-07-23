library(tidyverse)
library(janitor)
library(lubridate)
library(RSQLite)
## Get Directory Listing
## R  Code Video:
##  https://youtu.be/HpWce0ovphY
##
## Data Source:
## https://divvy-tripdata.s3.amazonaws.com/index.html
db <- dbConnect(SQLite(), dbname="../Google-Data-Analylitcs-Cert/cyclistic.sqlite3")
rm(list=ls())

##
## The Long Way ...
##
df1 <- read.csv("./Data/t1.csv")
df2 <- read.csv("./Data/t2.csv")
df3 <- read.csv("./Data/t3.csv")
df4 <- read.csv("./Data/t4.csv")
df5 <- read.csv("./Data/t5.csv")
df6 <- read.csv("./Data/t6.csv")
df7 <- read.csv("./Data/t7.csv")
df8 <- read.csv("./Data/t8.csv")
df9 <- read.csv("./Data/t9.csv")
df10 <- read.csv("./Data/t10.csv")
df11 <- read.csv("./Data/t11.csv")
df12 <- read.csv("./Data/t12.csv")
##
## Combine 12 data.frames into One (1) data.frame
##
bike_rides <- rbind(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12)
bike_rides <- janitor::remove_empty(bike_rides,which = c("cols"))
bike_rides <- janitor::remove_empty(bike_rides,which = c("rows"))
##
## Convert Data/Time stamp to Date/Time ...
##
bike_rides$started_at <- lubridate::ymd_hms(bike_rides$started_at)
bike_rides$ended_at <- lubridate::ymd_hms(bike_rides$ended_at)

bike_rides$start_hour <- lubridate::hour(bike_rides$started_at)
bike_rides$end_hour <- lubridate::hour(bike_rides$ended_at)

##
## Calculate trip duration
## Shoutout to Indrek Seppo on the Facebook R Statistical Software Group
bike_rides$trip_duration<- bike_rides$ended_at %--% bike_rides$started_at/minutes(1)

## Export

# write.csv(bike_rides,file="bikerides.csv",row.names = FALSE)

## 
## Connect to Ms SQL Server 2019

### SQL statement  to fix  negative drip duration

# Select case when datediff(minute, started_at, ended_at) < 0 
# then 0 
# else datediff(minute, started_at, ended_at) 
# end


### Loas SQLite database
dbWriteTable(db, "bikerides",bike_rides ,overwrite=TRUE)
dbListFields(con,"google")
# 
dbListTables(con)


df <- dbGetQuery(db,"select * from bikerides")