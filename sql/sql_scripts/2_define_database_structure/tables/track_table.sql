-- track.sql - Erstellen der Track Tabelle
SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

USE `DtoS`;

SET NAMES utf8mb4;

CREATE TABLE `track` (
  `track_id` varchar(20) NOT NULL,
  `release_id` int DEFAULT NULL,
  `title` varchar(768) DEFAULT NULL,
  `search_name` varchar(768) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
