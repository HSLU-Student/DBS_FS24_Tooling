USE dtos;
SELECT track.title,track.search_name,artist.name, artist.search_name
FROM artist 
JOIN track_has_artist ON artist.artist_id = track_has_artist.artist_id
JOIN track ON track_has_artist.track_id = track.track_id
WHERE artist.search_name = '<ARTISTNAME>'