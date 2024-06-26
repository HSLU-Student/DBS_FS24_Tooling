SELECT DISTINCT
    spotify_track.title AS `Track Title`,
    spotify_artist.name AS `Artist Name`,
    materialized_view.release_title AS `Release Title`,
    materialized_view.format AS `Format`,
    materialized_view.released AS `Release Year`,
    CONCAT ("https://discogs.com/sell/release/", materialized_view.release_id) AS `Buy On Dicogs`
FROM
    materialized_view
    JOIN spotify_track ON materialized_view.track_search_name = spotify_track.search_name
    -- Join spotify_artist & spotify_track (lookup by search_name)
    JOIN spotify_artist ON spotify_track.artist_id = spotify_artist.artist_id
    AND materialized_view.artist_search_name = spotify_artist.search_name
    -- Join spotify_playlist_has_spotify_track & spotify_track
    JOIN spotify_playlist_has_spotify_track sphst ON spotify_track.track_id = sphst.track_id
    -- Join spotify_playlist & spotify_playlist_has_spotify_track
    JOIN spotify_playlist ON sphst.playlist_id = spotify_playlist.playlist_id
    -- Join spotify_user & spotify_playlist
    JOIN spotify_user  ON spotify_playlist.user_id = spotify_user.user_id
    -- Filter User & Playlist
WHERE
    {{SpotifyUser}}
    [[AND {{Playlist}}]]
    [[-- Filter Track
    AND {{TrackTitle}}]]
    [[-- Filter Artist
    AND {{Artist}}]]
    [[-- Filter Format
    AND {{Format}}]]
    [[-- Filter Release year
    AND materialized_view.released > {{Released}}]]
ORDER BY 
    release_title