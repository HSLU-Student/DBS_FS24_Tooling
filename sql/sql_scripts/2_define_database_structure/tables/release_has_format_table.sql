-- Erstellen der Release-Format Junction Tabelle
SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

USE `DtoS`;

SET NAMES utf8mb4;

CREATE TABLE `release_has_format` (
  `release_id` int NOT NULL,
  `format_id` int  NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;