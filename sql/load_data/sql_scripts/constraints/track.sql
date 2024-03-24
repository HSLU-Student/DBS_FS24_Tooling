SET foreign_key_checks = 0;

USE `DtoS`;

 -- Start error handler to continue execution on error
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION BEGIN END;

ALTER TABLE `track` ADD CONSTRAINT PRIMARY KEY (`id`);
ALTER TABLE `track` ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`release_id`) REFERENCES `release` (`id`) ON DELETE RESTRICT;

-- Reset error handler
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION RESIGNAL;

