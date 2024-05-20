//step 3
//use dtos db
use('dtos');

//index for faster aggregation lookup
db.tracks.createIndex({ artist_id: 1 })
db.artists.createIndex({ artist_id: 1}) 

//aggregate artists & tracks
db.artists.aggregate([
  {
    $lookup: {
      from: "tracks",
      localField: "artist_id",
      foreignField: "artist_id",
      as: "tracks"
    }
  },
  { $out: "artists" }
])