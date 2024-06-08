USE `DtoS`;
SET NAMES utf8mb4;

LOAD DATA INFILE 'C:/Users/dbsstudent/Downloads/release_format.csv'
    INTO TABLE `release_has_format`
    FIELDS ENCLOSED BY '"'
    TERMINATED BY ';'
    LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES
    (release_id,format_id,format)
;