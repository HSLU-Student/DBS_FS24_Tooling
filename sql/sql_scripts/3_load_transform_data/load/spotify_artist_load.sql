USE `DtoS`;
SET NAMES utf8mb4;
INSERT INTO spotify_artist (`name`)
SELECT DISTINCT track_artists from temp_spotify_data Where `name` not in (Select user_name from spotify_user)