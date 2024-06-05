USE `DtoS`
SET NAMES utf8mb4;
INSERT INTO spotify_playlist (user_id,`name`)
SELECT DISTINCT u.id, t.playlist_name from temp_spotify_data t join spotify_user u on u.user_name = t.user_name;
