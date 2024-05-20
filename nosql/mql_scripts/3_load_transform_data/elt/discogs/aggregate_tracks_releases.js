//step 2
//use dtos db
use('dtos');

//index for faster aggregation lookup
db.releases.createIndex({ release_id: 1 })
db.tracks.createIndex({ release_id: 1 })

//aggregate track & releases
db.tracks.aggregate([
  {
    $lookup: {
      from: "releases",
      localField: "release_id",
      foreignField: "release_id",
      as: "release"
    }
  },
  {
    $unwind: "$release"
  },
  {$out: "tracks"}
])