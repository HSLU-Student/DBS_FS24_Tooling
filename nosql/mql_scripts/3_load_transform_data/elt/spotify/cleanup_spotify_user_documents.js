//step 3
use("dtos")

//cleanup spotify_user document
db.spotify_users.aggregate([
    {
        $project: {
            playlists: {
                _id: 0,
                user_id: 0,
                playlist_tracks: {
                    _id: 0,
                    playlist_id: 0
                }
            }
        }
    },
    {$out: "spotify_users"}
])