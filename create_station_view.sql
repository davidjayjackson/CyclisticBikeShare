CREATE TABLE stations AS
SELECT start_station_name,ROUND(start_lat,4) AS start_lat, ROUND(start_lng,4) AS start_lng
FROM bike
WHERE start_station_id IS NOT NULL AND end_station_id IS NOT NULL
GROUP BY start_station_name;


-- Create Index on Longitude and Latitude
-- Create Index on Longitude and Latitude

CREATE INDEX StationLongitude
ON stations (start_lng);

CREATE INDEX StationLatitude
ON stations (start_lat);

CREATE INDEX StationID
ON stations (start_station_name);