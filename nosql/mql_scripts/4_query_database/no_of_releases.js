use('dtos')

db.artists.aggregate([
    { $unwind: "$artist.tracks" },

    { $group: {
            _id: "$artist.tracks.release.release_id",
        }
    },
    
    { $count: 'count' }
])