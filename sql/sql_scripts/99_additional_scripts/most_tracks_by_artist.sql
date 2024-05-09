USE dtos;
SELECT COUNT(track.title), artist.search_name,artist.artist_id
FROM artist 
JOIN track_has_artist ON artist.artist_id = track_has_artist.artist_id
JOIN track ON track_has_artist.track_id = track.track_id
GROUP BY artist.artist_id
ORDER BY COUNT(track.title) DESC