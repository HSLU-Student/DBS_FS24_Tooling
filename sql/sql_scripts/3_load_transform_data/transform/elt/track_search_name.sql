Use DtoS;

Update track
set
    track_search_name = TRIM(
        LOWER(
            REGEXP_REPLACE (
                REGEXP_REPLACE (
                    REPLACE (REPLACE (track_title, '&', 'and'), ' ', ''),
                    '([0-9]+)',
                    ''
                ),
                '[^a-zA-ZÖÄÜäöüéàèêçËë ]',
                ''
            )
        )
    );
