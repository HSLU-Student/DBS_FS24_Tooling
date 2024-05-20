USE dtos;
SELECT 
    sphst.playlist_id,
    st.track_id,
    st.title AS spotify_track_title,
    st.search_name AS spotify_track_name,
    sa.name AS spotify_artist_name, sa.search_name AS spotify_artist_search_name 
FROM spotify_track st
JOIN spotify_playlist_has_spotify_track sphst ON st.track_id = sphst.track_id
JOIN spotify_artist sa ON st.artist_id = sa.artist_id