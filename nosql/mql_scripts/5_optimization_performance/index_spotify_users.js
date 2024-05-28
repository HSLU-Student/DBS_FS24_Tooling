use('dtos')
//TODO test a compound index, to combine artist & tracks searchname for further speedup
db.spotify_users.createIndexes([{"spotify_user.playlists.playlist_tracks.track_search_name":1},{"spotify_user.playlists.playlist_tracks.artist_search_name":1}])