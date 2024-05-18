SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `spotify_playlist` ADD Constraint PRIMARY KEY (`playlist_id`);
ALTER TABLE `spotify_playlist` ADD CONSTRAINT `spotify_playlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `spotify_user` (`user_id`) ON DELETE CASCADE;
