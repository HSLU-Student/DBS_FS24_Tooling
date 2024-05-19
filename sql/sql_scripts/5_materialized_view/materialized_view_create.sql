USE DtoS;

CREATE TABLE
    materialized_view
SELECT distinct
    a.search_name as artist_search_name,
    t.search_name as track_search_name,
    r.release_id,
    r.title as release_title,
    r.released,
    f.format
FROM
    artist a
    join track_has_artist ta on ta.artist_id = a.artist_id
    join track t on t.track_id = ta.track_id
    join `release` r on r.release_id = t.release_id
    join release_has_format rf on rf.release_id = r.release_id
    join format f on f.format_id = rf.format_id;
    