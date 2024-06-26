-- artist.sql - Erstellen der Artisten Tabelle
SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

USE `DtoS`;

SET NAMES utf8mb4;

CREATE TABLE `artist` (
  `artist_id` int NOT NULL,
  `name` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `search_name` varchar(768) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
