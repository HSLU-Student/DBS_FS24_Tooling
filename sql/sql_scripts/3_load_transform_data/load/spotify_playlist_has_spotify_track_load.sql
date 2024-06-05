USE `DtoS`;

SET
    NAMES utf8mb4;

INSERT INTO
    spotify_playlist_has_spotify_track (track_id, playlist_id)
SELECT DISTINCT
    t.track_id,
    p.playlist_id
from
    temp_spotify_data tsd
    join spotify_track st on st.track_title = tsd.track_name
    join spotify_playlist sp on sp.playlistname = tsd.playlist_name
WHERE
    CONCAT (st.track_id, "\\", sp.playlist_id) not in (
        Select
            CONCAT (track_id, "\\", playlist_id)
        from
            spotify_playlist_has_spotify_track
    );