use('dtos')
//TODO test a compound index, to combine artist & tracks searchname for further speedup
db.artists.createIndexes([{"artist.search_name":1},{"artist.tracks.search_name":1}])