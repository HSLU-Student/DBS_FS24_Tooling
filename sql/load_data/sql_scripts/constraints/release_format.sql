SET foreign_key_checks = 0;

USE `DtoS`;

 
ALTER TABLE `release_format` ADD Constraint PRIMARY KEY (`release_id`,`format_id`);
ALTER TABLE `release_format` ADD CONSTRAINT `release_format_ibfk_2` FOREIGN KEY (`format_id`) REFERENCES `format` (`id`) ON DELETE CASCADE;
ALTER TABLE `release_format` ADD CONSTRAINT `release_format_ibfk_3` FOREIGN KEY (`release_id`) REFERENCES `release` (`id`) ON DELETE CASCADE;