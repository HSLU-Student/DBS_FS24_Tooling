USE `DtoS`;
SET NAMES utf8mb4;

    LOAD DATA INFILE '/var/lib/mysql-files/table_data/track.csv'
    INTO TABLE `track`
    FIELDS OPTIONALLY ENCLOSED BY '"'
    TERMINATED BY ';'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (id, release_id, @title)
    SET title = LEFT(@title, 768);
    ;