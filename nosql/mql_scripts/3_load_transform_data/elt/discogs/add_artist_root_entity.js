//step 5
//use dtos db
use('dtos');

//add artist root entry
db.artists.aggregate([
    {
        $project: {
            artist: {
                artist_id: "$artist_id",
                name: "$name",
                search_name: "$search_name",
                tracks: "$tracks"
            }
        }
    },
    {$out: "artists"}
])