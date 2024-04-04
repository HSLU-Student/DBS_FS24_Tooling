SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `track_artist` ADD CONSTRAINT PRIMARY KEY (`track_id`,`artist_id`);
ALTER TABLE `track_artist` ADD CONSTRAINT `track_artist_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`) ON DELETE CASCADE;
ALTER TABLE `track_artist` ADD CONSTRAINT `track_artist_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE CASCADE;