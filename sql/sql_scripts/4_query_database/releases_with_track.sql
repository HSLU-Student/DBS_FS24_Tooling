USE dtos;
SELECT DISTINCT pt.track_name AS `Track Title`,
pt.artist_name AS `Artist Name`,
r.title AS `Release Title`,
f.format AS `Format`,
r.released AS `Release Year`, CONCAT("discogs.com/sell/release/",r.release_id) AS `Buy On Dicogs` FROM format f
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
-- Join playlist_track & track
JOIN playlist_track pt ON t.search_name = pt.track_search_name AND a.search_name = pt.artist_search_name
-- Join playlist & playlist_track
JOIN playlist p ON pt.playlist_id = p.playlist_id
-- Join spotify_user & playlist
JOIN spotify_user u ON p.user = u.user_id
-- Filter User & Playlist
WHERE u.user_name = 'TheKetio' AND p.name = 'diesdas'
-- Filter Track
AND t.title = 'House of the Rising Sun'
-- Filter Artist
AND a.name = 'The Animals'
-- Filter Format
AND f.format = 'Vinyl' 
-- Filter Release year
AND r.released >= '1901'