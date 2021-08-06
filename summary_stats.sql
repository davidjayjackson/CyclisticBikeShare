SELECT date(started_at) AS Ymd, 
sum(duration) AS Sum,
avg(duration) AS Mean,
max(duration) AS Max,
min(duration) AS Min,
count(*) AS TPD
FROM t1
WHERE duration >0
GROUP BY Ymd
