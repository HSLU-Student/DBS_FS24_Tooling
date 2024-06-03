[
    { $match:{{SpotifyUser}} } ,

    {$unwind: "$spotify_user.playlists"},

    [[{ $match: {"spotify_user.playlists.name":{{Playlist}}}},]]

    { $unwind: "$spotify_user.playlists.playlist_tracks" },
    
    [[{ $match: { "spotify_user.playlists.playlist_tracks.artist_name": {{Artist}} } },]]


    { $replaceRoot: { newRoot: "$spotify_user.playlists.playlist_tracks" } },

    { $lookup: {
          from: "artists",
          localField: "artist_search_name",
          foreignField: "artist.search_name",
          as: "matched_artists"
        }
    },

    { $unwind: "$matched_artists" },
    
    { $set: {
            "matched_artists.artist.tracks": {
                $filter: {
                    input: "$matched_artists.artist.tracks",
                    cond: { $eq: ["$$this.search_name", "$track_search_name"]}
                } 
            }
        }
    },
    
    { $unwind: "$matched_artists.artist.tracks" },

    { $replaceWith: {
            release: {
                "title": "$track_title",
                "artist": "$artist_name",
                "release": "$matched_artists.artist.tracks.release" 
            } 
        }
    },
    
    [[{ $match: { "release.release.released": {$gt: {{Released}}}}},]]
   
    { $unwind: "$release.release.formats" },

    [[{ $match: { "release.release.formats":{{Format}} } },]]

    { $group: {
        _id: { 
            "release_id": "$release.release.release_id",
            "title": "$release.release.title",
            "formats":"$release.release.formats",
            "released":"$release.release.released" 
        },
        no_of_tracks: {$sum: 1}
    }},

    { $addFields: {
            "url": {
                $concat: ["https://discogs.com/sell/release/", { $toString: "$_id.release_id" }]
            }
        }
    },

    { $sort: { "no_of_tracks": -1, "_id.title": 1 } },
    
    { $project: {
            "_id": 0
            "Release Title": "$_id.title",
            "Format": "$_id.formats",
            "Release Year": "$_id.released",
            "Buy on Discogs": "$url",
            "Tracks from Playlist in Release": "$no_of_tracks"
        }
    }
]