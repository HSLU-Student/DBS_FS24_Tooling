SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `release` ADD Constraint PRIMARY KEY (`id`);
ALTER TABLE `release` ADD INDEX `title` (`title`);