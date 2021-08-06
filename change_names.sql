ALTER TABLE test
RENAME COLUMN start_lat  TO latitude;

ALTER TABLE test
RENAME COLUMN start_lng  TO longitude;

ALTER TABLE stations
RENAME COLUMN start_lat  TO latitude;

ALTER TABLE stations
RENAME COLUMN start_lng  TO longitude;