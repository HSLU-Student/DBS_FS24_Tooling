-- format.sql - Erstellen der Format Tabelle
SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

USE `DtoS`;

SET NAMES utf8mb4;

<<<<<<< HEAD:sql/sql_scripts/2_define_database_structure/tables/format_table.sql
CREATE TABLE `format` (
  `format_id` int NOT NULL,
  `format` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
=======
CREATE TABLE `artist` (
  `id` int NOT NULL,
  `name` varchar(768) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


>>>>>>> main:sql/load_data/sql_scripts/noFKConstraints/artist.sql
