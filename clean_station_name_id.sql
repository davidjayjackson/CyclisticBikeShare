
SELECT s.start_station_id,s.start_station_name,s.start_lat,s.start_lng,started_at,ended_at,member_casual,
FROM bike AS b
LEFT JOIN stations AS s
ON s.start_lat = b.start_lat AND s.start_lng = b.start_lng