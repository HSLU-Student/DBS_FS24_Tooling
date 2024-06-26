SELECT DISTINCT
    materialized_view.release_title AS `Release Title`,
    materialized_view.format AS `Format`,
    materialized_view.released AS `Release Year`,
    CONCAT ("https://discogs.com/sell/release/", materialized_view.release_id) AS `Buy on Dicogs`,
    COUNT(*) AS `Tracks from Playlist in Release`
FROM
    materialized_view
    JOIN spotify_track st ON materialized_view.track_search_name = st.search_name
    -- Join spotify_artist on spotify_track (lookup by search_name)
    JOIN spotify_artist spotify_artist ON st.artist_id = spotify_artist.artist_id
    and materialized_view.artist_search_name = spotify_artist.search_name
    -- Join spotify_playlist_has_spotify_track & spotify_track
    JOIN spotify_playlist_has_spotify_track sphst on st.track_id = sphst.track_id
    -- Join spotify_playlist & spotify_playlist_has_spotify_track 
    JOIN spotify_playlist  ON sphst.playlist_id = spotify_playlist.playlist_id
    -- Join spotify_user & spotify_playlist
    JOIN spotify_user ON spotify_playlist.user_id = spotify_user.user_id
    -- Filter & Playlist
WHERE
    {{SpotifyUser}}
    [[AND {{Playlist}}]]
   [[ -- Filter Format
    AND {{Format}}]]
    [[-- Filter Artist 
    AND {{Artist}}]]
    [[-- Filter Release year
    AND materialized_view.released > {{Released}}]]
    -- Group releases with multiple tracks
GROUP BY
    materialized_view.format,
    materialized_view.release_id,
    materialized_view.release_title,
    materialized_view.released
    -- Release with most tracks from playlist, show ontop
ORDER BY
    COUNT(*) DESC ,release_title