library(tidyverse)
library(janitor)
library(lubridate)
## Get Directory Listing
## R  Code Video:
##  https://youtu.be/HpWce0ovphY
##
## Data Source:
## https://divvy-tripdata.s3.amazonaws.com/index.html
rm(list=ls())
dir("Data",full.names = T)
cbike <-dir("Data",full.names=T) %>% map_df(read_csv,skip=1)
##
## The Long Way ...
##
df1 <- read.csv("./Data/202004-divvy-tripdata.csv")
df2 <- read.csv("./Data/202005-divvy-tripdata.csv")
df3 <- read.csv("./Data/202006-divvy-tripdata.csv")
df4 <- read.csv("./Data/202007-divvy-tripdata.csv")
df5 <- read.csv("./Data/202008-divvy-tripdata.csv")
df6 <- read.csv("./Data/202009-divvy-tripdata.csv")
df7 <- read.csv("./Data/202010-divvy-tripdata.csv")
df8 <- read.csv("./Data/202011-divvy-tripdata.csv")
df9 <- read.csv("./Data/202012-divvy-tripdata.csv")
df10 <- read.csv("./Data/202101-divvy-tripdata.csv")
df11 <- read.csv("./Data/202102-divvy-tripdata.csv")
df12 <- read.csv("./Data/202103-divvy-tripdata.csv")
##
## Combine 12 data.frames into One (1) data.frame
##
bike_rides <- rbind(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12)
bike_rides <- janitor::remove_empty(bike_rides,which = c("cols"))
bike_rides <- janitor::remove_empty(bike_rides,which = c("rows"))
## Convert Data/Time stamp to Date/Time ...

bike()
