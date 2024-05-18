SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `spotify_artist` ADD Constraint PRIMARY KEY (`artist_id`);
ALTER TABLE `spotify_artist` ADD INDEX `spotify_artist_search_name` (`search_name`);
