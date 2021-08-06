INSERT INTO t1
SELECT * 
FROM t2;

INSERT INTO t1
SELECT * 
FROM t3;

INSERT INTO t1
SELECT * 
FROM t4;

INSERT INTO t1
SELECT * 
FROM t5;

INSERT INTO t1
SELECT * 
FROM t6;

INSERT INTO t1
SELECT * 
FROM t7;

INSERT INTO t1
SELECT * 
FROM t8;

INSERT INTO t1
SELECT * 
FROM t9;

INSERT INTO t1
SELECT * 
FROM t10;

INSERT INTO t1
SELECT * 
FROM t11;

INSERT INTO t1
SELECT * 
FROM t12;

-- Create bikeride table with long and lat rounded to 1 place

CREATE TABLE bike AS
SELECT start_station_id,start_station_name,started_at,ended_at,
				(julianday(ended_at)-julianday(started_at))/60 as duration,
				round(start_lat,1) AS start_lat,
				ROUND(start_lng,1) AS start_lng
FROM t1;
-- Create Index on Longitude and Latitude

CREATE INDEX Longitude
ON bike (start_lng);

CREATE INDEX Latitude
ON bike (start_lat);