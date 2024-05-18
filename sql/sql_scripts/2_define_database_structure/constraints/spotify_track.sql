SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `spotify_track` ADD Constraint PRIMARY KEY (`track_id`)
ALTER TABLE `spotify_track` ADD CONSTRAINT `spotify_track_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `spotify_artist` (`artist_id`) ON DELETE CASCADE;
ALTER TABLE `spotify_track` ADD INDEX `spotify_track_search_name` (`search_name`);
