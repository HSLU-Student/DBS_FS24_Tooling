//step 2
use("dtos")

//index for faster aggregation lookup
db.spotify_playlists.createIndex({ user_id: 1 })
db.spotify_users.createIndex({ user_id: 1 })

//aggregate users & playlists
db.spotify_users.aggregate([
    {
        $lookup: {
          from: "spotify_playlists",
          localField: "user_id",
          foreignField: "user_id",
          as: "playlists"
        }
    },
    {$out: "spotify_users"}
])