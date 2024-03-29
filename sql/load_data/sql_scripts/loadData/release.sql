USE `DtoS`;
SET NAMES utf8mb4;
LOAD DATA INFILE '/var/lib/mysql-files/table_data/release.csv'
INTO TABLE `release`
FIELDS OPTIONALLY ENCLOSED BY '"'
TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id, @title, released,country, master_id)
SET title = LEFT(@title, 768);
;