USE `DtoS`;
SET NAMES utf8mb4;
LOAD DATA INFILE 'C:/Users/dbsstudent/Downloads/release.csv'
INTO TABLE `release`
FIELDS OPTIONALLY ENCLOSED BY '"'
TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id, @title, released)
SET title = LEFT(@title, 768);
;

