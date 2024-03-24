SET foreign_key_checks = 0;

USE `DtoS`;

ALTER TABLE `artist` ADD Constraint PRIMARY KEY (`id`);
  ALTER TABLE `artist` ADD INDEX `name` (`name`);