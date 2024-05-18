SELECT DISTINCT
r.title AS `Release Title`,
f.format AS `Format`,
r.released AS `Release Year`, 
CONCAT("discogs.com/sell/release/",r.release_id) AS `Buy on Dicogs`,
COUNT(*) AS `Tracks from playlist in release`
FROM format f
-- Join release_has_format & format 
JOIN release_has_format rf ON f.format_id  = rf.format_id
-- Join release & release_has_format
JOIN `release` r ON rf.release_id = r.release_id
-- Join track & release
JOIN track t ON r.release_id = t.release_id
-- Join track_has_artist & track
JOIN track_has_artist ta ON t.track_id = ta.track_id
-- Join artist & track_has_artist
JOIN artist a ON ta.artist_id = a.artist_id

-- Join spotify_track & track (lookup by search_name)
JOIN spotify_track st ON t.search_name = st.search_name
-- Join spotify_artist on spotify_track (lookup by search_name)
JOIN spotify_artist sa ON st.artist_id = sa.artist_id and a.search_name = sa.search_name
-- Join spotify_playlist_has_spotify_track & spotify_track
JOIN spotify_playlist_has_spotify_track sphst on st.track_id = sphst.track_id
-- Join spotify_playlist & spotify_playlist_has_spotify_track 
JOIN spotify_playlist sp ON sphst.playlist_id = sp.playlist_id
-- Join spotify_user & spotify_playlist
JOIN spotify_user su ON sp.user_id = su.user_id

-- Filter & Playlist
WHERE su.user_name = 'TheKetio' AND sp.name = 'diesdas'
-- Filter Format
AND f.format = 'Vinyl' 
-- Filter Release year
AND r.released >= '1901'
-- Group releases with multiple tracks
GROUP BY r.title, f.format, r.released,CONCAT("discogs.com/sell/release/",r.release_id)
-- Releaes with most tracks from playlist, show ontop
ORDER BY COUNT(*) DESC 