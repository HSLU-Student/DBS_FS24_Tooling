//step 4
//use dtos db
use("dtos")

//add spotify_user root entry
db.spotify_users.aggregate([
    {
        $project: {
            spotify_user: {
                user_id: "$user_id",
                username: "$username",
                playlists: "$playlists",
            }
        }
    },
    {$out: "spotify_users"}
])