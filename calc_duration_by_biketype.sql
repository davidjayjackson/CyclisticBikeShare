SELECT rideable_type,date(started_at) AS Ymd, 
sum(duration) AS Sum,
avg(duration) AS Mean,
max(duration) AS Max,
min(duration) AS Min,
count(*) AS TPD
FROM detail
GROUP BY rideable_type,Ymd