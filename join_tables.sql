CREATE TABLE test AS
SELECT s.start_station_name,rideable_type,member_casual, s.longitude ,s.latitude, started_at, ended_at, duration
FROM stations AS s
JOIN detail AS d
ON (s.latitude = d.start_lat AND s.longitude = d.start_lng);