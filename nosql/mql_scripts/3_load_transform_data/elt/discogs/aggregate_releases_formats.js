//step 1
//use dtos db
use('dtos');

//index for faster aggregation lookup
db.formats.createIndex({ release_id:1 })
db.releases.createIndex({ release_id: 1 })

//aggregate format & releases
db.releases.aggregate([
  {
    $lookup: {
      from: "formats",
      localField: "release_id",
      foreignField: "release_id",
      as: "formats"
    }
  },
  {
    $addFields: {
      formats: {
        $map: {
          input: "$formats",
          as: "formats",
          in: "$$formats.format"
        }
      }
    }
  },
  {$out: "releases"}
])