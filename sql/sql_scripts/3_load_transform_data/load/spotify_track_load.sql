USE `DtoS`;

SET
    NAMES utf8mb4;

INSERT INTO
    spotify_track (`title`)
SELECT DISTINCT
    track_artists
from
    temp_spotify_data
Where
    CONCAT (track_artists, "\\", track_name) not in (
        Select
            CONCAT (a.name, "\\", t.title)
        from
            spotify_artist a
            join spotify_track t on t.artist_id = a.artist_id
    );