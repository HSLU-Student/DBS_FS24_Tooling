ALTER TABLE `materialized_view` ADD INDEX `materialized_view_artist_search_name` (`artist_search_name`);
ALTER TABLE `materialized_view` ADD INDEX `materialized_view_track_search_name` (`track_search_name`);
ALTER TABLE `materialized_view` ADD INDEX `materialized_view_released` (`released`);
ALTER TABLE `materialized_view` ADD INDEX `materialized_view_format` (`format`);

