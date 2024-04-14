-- Adminer 4.8.1 MySQL 8.0.36 dump
-- Erstellen der Format Tabelle
SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

USE `DtoS`;

SET NAMES utf8mb4;

CREATE TABLE `release_has_format` (
  `release_id` int  ,
  `format_id` int  ,
  `format` varchar(100) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 2024-03-22 14:12:08
