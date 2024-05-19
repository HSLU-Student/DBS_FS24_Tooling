SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `track` ADD CONSTRAINT PRIMARY KEY (`track_id`);
ALTER TABLE `track` ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`release_id`) REFERENCES `release` (`release_id`) ON DELETE CASCADE;
ALTER TABLE `track` ADD INDEX `track_search_name` (`search_name`);
ALTER TABLE `track` ADD INDEX `track_title` (`title`);
