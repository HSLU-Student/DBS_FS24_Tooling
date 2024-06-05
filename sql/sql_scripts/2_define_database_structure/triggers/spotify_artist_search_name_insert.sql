CREATE TRIGGER `spotify_artist_search_name_insert` BEFORE INSERT ON `spotify_artist` FOR EACH ROW
SET
    NEW.search_name = TRIM(
        LOWER(
            REGEXP_REPLACE (
                REGEXP_REPLACE (
                    REPLACE (REPLACE (NEW.name, '&', 'and'), ' ', ''),
                    '([0-9]+)',
                    ''
                ),
                '[^a-zA-ZÖÄÜäöüéàèêçËë ]',
                ''
            )
        )
    )