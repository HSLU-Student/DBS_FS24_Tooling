SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `DtoS`;

SET NAMES utf8mb4;

CREATE TABLE `spotify_track` (
  `track_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(768) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `search_name` varchar(768) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `artist_id` int NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
