[
    { $match: {{SpotifyUser}} },

    {$unwind: "$spotify_user.playlists"},

    { $match: { "spotify_user.playlists.name": {{Playlist}} } },

    { $unwind: "$spotify_user.playlists.playlist_tracks" },

    [[{ $match: { "spotify_user.playlists.playlist_tracks.artist_name": {{Artist}} } },]]

    [[{ $match: { "spotify_user.playlists.playlist_tracks.track_title": {{TrackTitle}} } },]]
    
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
    
    [[{ $match: { "release.release.released": {$gt:{{Released}}}}},]]
    
    { $unwind: "$release.release.formats" },

    [[{ $match: { "release.release.formats":{{Format}}}},]]

    { $addFields: {
            "release.url": {
                $concat: ["https://discogs.com/sell/release/", { $toString: "$release.release.release_id" }]
            }
        }
    },
    
    { $group: {
            _id: {
                "track_title": "$release.title",
                "release_artist": "$release.artist",
                "release_title": "$release.release.title",
                "format": "$release.release.formats",
                "released": "$release.release.released",
                "url": "$release.url"
            }
        }
    },
    
    { $sort: {"_id:release_title": 1}},
    
    { $project: {
            _id: 0,
            "Track Title": "$_id.track_title",
            "Artist Name": "$_id.release_artist",
            "Release Title": "$_id.release_title",
            "Format": "$_id.format",
            "Release Year": "$_id.released",
            "Buy On Discogs": "$_id.url"
        }
    }
]
