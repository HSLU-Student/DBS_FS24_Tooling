USE `DtoS`;
SET NAMES utf8mb4;

LOAD DATA INFILE 'C:/Users/dbsstudent/Downloads/track_artist.csv'
    INTO TABLE `track_has_artist`
    FIELDS ENCLOSED BY '"'
    TERMINATED BY ';'
    LINES TERMINATED BY '\r\n' 
    IGNORE 1 LINES
    (track_id, artist_id, artist_name)