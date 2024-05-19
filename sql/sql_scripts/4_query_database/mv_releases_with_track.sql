USE dtos;

SELECT DISTINCT
    st.title AS `Track Title`,
    sa.name AS `Artist Name`,
    mv.release_title AS `Release Title`,
    mv.format AS `Format`,
    mv.released AS `Release Year`,
    CONCAT ("discogs.com/sell/release/", mv.release_id) AS `Buy On Dicogs`
FROM
    materialized_view mv
    JOIN spotify_track st ON mv.track_search_name = st.search_name
    -- Join spotify_artist & spotify_track (lookup by search_name)
    JOIN spotify_artist sa ON st.artist_id = sa.artist_id
    AND mv.artist_search_name = sa.search_name
    -- Join spotify_playlist_has_spotify_track & spotify_track
    JOIN spotify_playlist_has_spotify_track sphst ON st.track_id = sphst.track_id
    -- Join spotify_playlist & spotify_playlist_has_spotify_track
    JOIN spotify_playlist sp ON sphst.playlist_id = sp.playlist_id
    -- Join spotify_user & spotify_playlist
    JOIN spotify_user su ON sp.user_id = su.user_id
    -- Filter User & Playlist
WHERE
    su.user_name = 'TheKetio'
    AND sp.name = 'diesdas'
    -- Filter Track
    AND st.title = 'House of the Rising Sun'
    -- Filter Artist
    AND sa.name = 'The Animals'
    -- Filter Format
    AND mv.format = 'CD'
    -- Filter Release year
    AND mv.released >= '1999'