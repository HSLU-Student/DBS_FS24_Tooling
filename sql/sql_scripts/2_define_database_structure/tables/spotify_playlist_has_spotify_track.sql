SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `DtoS`;

SET NAMES utf8mb4;

CREATE TABLE `spotify_playlist_has_spotify_track` (
  `playlist_id` int NOT NULL,
  `track_id` int NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
