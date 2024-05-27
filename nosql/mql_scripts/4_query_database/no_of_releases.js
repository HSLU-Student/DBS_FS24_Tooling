use('dtos')

db.artists.aggregate([
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