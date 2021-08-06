CREATE TABLE analytics AS

SELECT start_station_name,member_casual,rideable_type,date(started_at) AS Ymd, 
sum(duration) AS Sum,
avg(duration) AS Mean,
max(duration) AS Max,
min(duration) AS Min,
count(*) AS TPD
FROM t1
WHERE start_station_name IS NOT NULL AND duration >0
GROUP BY start_station_name,member_casual,rideable_type,Ymd;