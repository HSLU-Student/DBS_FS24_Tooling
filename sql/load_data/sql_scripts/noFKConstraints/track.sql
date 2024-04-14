-- Adminer 4.8.1 MySQL 8.0.36 dump
-- Erstellen der Track Tabelle
SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

USE `DtoS`;

SET NAMES utf8mb4;

CREATE TABLE `track` (
  `track_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `release_id` int DEFAULT NULL,
  `title` varchar(768) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 2024-03-22 14:12:09

