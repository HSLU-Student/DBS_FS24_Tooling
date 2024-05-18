SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `spotify_playlist_has_spotify_track` ADD Constraint PRIMARY KEY (`playlist_id`,'track_id');
ALTER TABLE `spotify_playlist_has_spotify_track` ADD CONSTRAINT `spotify_playlist_has_spotify_track_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `spotify_playlist` (`playlist_id`) ON DELETE CASCADE;
ALTER TABLE `spotify_playlist_has_spotify_track` ADD CONSTRAINT `spotify_playlist_has_spotify_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `spotify_track` (`track_id`) ON DELETE CASCADE;
