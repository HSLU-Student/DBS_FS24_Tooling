USE `DtoS`;
SET NAMES utf8mb4;
INSERT INTO spotify_user (user_name)
SELECT DISTINCT user_name from temp_spotify_data Where user_name not in (Select user_name from spotify_user)