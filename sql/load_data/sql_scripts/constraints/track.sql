SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `track` ADD CONSTRAINT PRIMARY KEY (`id`);
ALTER TABLE `track` ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`release_id`) REFERENCES `release` (`id`) ON DELETE CASCADE;
ALTER TABLE `track` ADD INDEX `title` (`title`);


