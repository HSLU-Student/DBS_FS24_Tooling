USE dtos;
SELECT DISTINCT pt.track_name AS `Track Title`, pt.artist_name AS `Artist Name`,r.title AS `Release Title`,r.released AS `Release Year`, Concat("discogs.com/de/release/",r.release_id) AS `Discogs Link` FROM format f
JOIN release_has_format rf ON rf.format_id = f.format_id
JOIN `release` r ON r.release_id= rf.release_id
JOIN track t ON t.release_id = r.release_id
JOIN track_has_artist ta ON ta.track_id = t.track_id 
JOIN artist a ON ta.artist_id = a.artist_id
JOIN playlist_track pt ON pt.track_search_name = t.search_name AND pt.artist_search_name = a.search_name
WHERE f.format='<Format>' AND pt.playlist_id = '<PlaylistID>' AND r.released >= '<ReleaseYear>' ; 