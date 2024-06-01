use('dtos')

db.artists.aggregate([
    { $unwind: "$artist.tracks" },

    { $group: {
          _id: "$artist.tracks.track_id"
        }
    },

    { $count: 'count' }
])