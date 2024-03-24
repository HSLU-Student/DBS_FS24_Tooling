USE `DtoS`;
SET NAMES utf8mb4;

LOAD DATA INFILE '/var/lib/mysql-files/table_data/release_format.csv'
    INTO TABLE `release_format`
    FIELDS ENCLOSED BY '"'
    TERMINATED BY ';'
    LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES
    (release_id,format_id,format)
;