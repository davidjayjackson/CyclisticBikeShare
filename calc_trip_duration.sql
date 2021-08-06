CREATE TABLE detail AS
SELECT start_lat,start_lng,
rideable_type,
member_casual,
started_at,ended_at,
(julianday(ended_at)-julianday(started_at))*3600 as duration 
FROM t1
WHERE duration >0

