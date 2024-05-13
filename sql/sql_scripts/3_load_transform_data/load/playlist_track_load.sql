USE dtos;
SET @json='';
INSERT INTO playlist_track (playlist_id, track_name, artist_name, album_name)
SELECT
    1,
    track_name,
    artists_name,
    album_name
FROM
    JSON_TABLE(@json, '$.items[]' COLUMNS (
        track_name VARCHAR(768) PATH '$.track.name',
        artists_name VARCHAR(450) PATH '$.track.artists[].name',
        album_name VARCHAR(768) PATH '$.track.album.name'
    )) AS track
WHERE 
  track_name IS NOT NULL
  AND artists_name IS NOT NULL
;