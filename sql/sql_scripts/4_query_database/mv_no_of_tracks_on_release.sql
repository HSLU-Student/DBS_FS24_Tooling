USE dtos;

SELECT DISTINCT
    mv.title AS `Release Title`,
    mv.format AS `Format`,
    mv.released AS `Release Year`,
    CONCAT ("https://discogs.com/sell/release/", r.release_id) AS `Buy on Dicogs`,
    COUNT(*) AS `Tracks from playlist in release`
FROM
    materialized_view mv
    JOIN spotify_track st ON mv.track_search_name = st.search_name
    -- Join spotify_artist on spotify_track (lookup by search_name)
    JOIN spotify_artist sa ON st.artist_id = sa.artist_id
    and a.search_name = sa.search_name
    -- Join spotify_playlist_has_spotify_track & spotify_track
    JOIN spotify_playlist_has_spotify_track sphst on st.track_id = sphst.track_id
    -- Join spotify_playlist & spotify_playlist_has_spotify_track 
    JOIN spotify_playlist sp ON sphst.playlist_id = sp.playlist_id
    -- Join spotify_user & spotify_playlist
    JOIN spotify_user su ON sp.user_id = su.user_id
    -- Filter & Playlist
WHERE
    su.user_name = 'TheKetio'
    AND sp.name = 'diesdas'
    -- Filter Artist
    AND sa.name = 'The Animals'
    -- Filter Format
    AND mv.format = 'Vinyl'
    -- Filter Release year
    AND mv.released >= '1901'
    -- Group releases with multiple tracks
GROUP BY
    f.format,
    r.release_id
    -- Release with most tracks from playlist, show ontop
ORDER BY
    COUNT(*) DESC