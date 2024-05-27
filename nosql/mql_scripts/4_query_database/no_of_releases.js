use('dtos')

db.artists2.aggregate([
    {
        $unwind: {
          path: "$artist.tracks",
        }
    },
    {
        $group: {
            _id: "$artist.tracks.release.release_id",
        }
    },
    {$count: 'count'}
])