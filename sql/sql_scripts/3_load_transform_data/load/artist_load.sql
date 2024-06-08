USE `DtoS`;
SET NAMES utf8mb4;

LOAD DATA INFILE 'C:/Users/dbsstudent/Downloads/artist.csv'
    INTO TABLE `artist`
    FIELDS OPTIONALLY ENCLOSED BY '"'
    TERMINATED BY ';'
    LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES
    (id, @name)
    SET name = LEFT(@name, 768);

;

