SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `DtoS`;

SET NAMES utf8mb4;

CREATE TABLE `spotify_artist` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `search_name` varchar(450) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
