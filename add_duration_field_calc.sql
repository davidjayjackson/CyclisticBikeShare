ALTER TABLE t1
ADD COLUMN duration REAL;

UPDATE t1
SET duration = (julianday(ended_at)-julianday(started_at))*1440;