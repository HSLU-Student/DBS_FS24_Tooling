SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `format` ADD Constraint PRIMARY KEY (`format_id`);
ALTER TABLE `format` ADD INDEX `format_format` (`format`);
