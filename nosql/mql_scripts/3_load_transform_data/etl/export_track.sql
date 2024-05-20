-- Export der Track Daten für MongoDB
SELECT t.*, thr.artist_id  FROM track t
JOIN track_has_artist thr ON t.track_id = thr.track_id