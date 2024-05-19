SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `artist` ADD Constraint PRIMARY KEY (`artist_id`);
ALTER TABLE `artist` ADD INDEX `artist_search_name` (`search_name`);
ALTER TABLE `artist` ADD INDEX `artist_name` (`name`);

