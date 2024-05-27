use('dtos')

db.artists2.aggregate([
    {
        $unwind: {
          path: "$artist.tracks"
        }
    },
    //technically we don't need this grouping as one track = one release
    {
        $group: {
          _id: "$artist.tracks.track_id"
        }
    },
    {
        $count: 'count'
    }
])