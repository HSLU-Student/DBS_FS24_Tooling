USE `DtoS`;
SET NAMES utf8mb4;

LOAD DATA INFILE '/var/lib/mysql-files/table_data/track_artist.csv'
    INTO TABLE `track_artist`
    FIELDS ENCLOSED BY '"'
    TERMINATED BY ';'
    LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES
    (track_id, artist_id,artist_name)