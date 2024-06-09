use('dtos')

db.artists.createIndexes([{ "artist.search_name": 1 }, { "artist.tracks.search_name": 1 }])