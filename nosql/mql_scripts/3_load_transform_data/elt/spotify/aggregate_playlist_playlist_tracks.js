//step 1
use("dtos")

//index for faster aggregation lookup
db.spotify_tracks.createIndex({ playlist_id: 1 })
db.spotify_playlists.createIndex({ playlist_id: 1 })

//aggregate playlists & playlist_tracks
db.spotify_playlists.aggregate([
    {
        $lookup: {
          from: "spotify_tracks",
          localField: "playlist_id",
          foreignField: "playlist_id",
          as: "playlist_tracks"
        }
    },
    {$out: "spotify_playlists"}
])