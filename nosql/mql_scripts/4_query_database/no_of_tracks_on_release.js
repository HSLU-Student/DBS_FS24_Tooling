use('dtos')

db.spotify_users.aggregate([
    //find the user in the spotify DB
    { $match: { "spotify_user.username": "TheKetio" } },

    //unwind all user playlists
    {$unwind: "$spotify_user.playlists"},

    //match only the selected playlist
    { $match: { "spotify_user.playlists.name": "diesdas" } },

    //unwind all playlist tracks
    { $unwind: "$spotify_user.playlists.playlist_tracks" },

    //optional! filter on artist by removing all documents not having the selected artist
    { $match: { "spotify_user.playlists.playlist_tracks.artist_name": "The Animals" } },
    
    //set the playlist tracks as new root to flatten the structure
    { $replaceRoot: { newRoot: "$spotify_user.playlists.playlist_tracks" } },

    //lookup possible artists foreach track.
    { $lookup: {
          from: "artists",
          localField: "artist_search_name",
          foreignField: "artist.search_name",
          as: "matched_artists"
        }
    },

    //once again unwinding the remaining possible artists
    { $unwind: "$matched_artists" },
    
    //remove all tracks which do not match the track_search_name
    { $set: {
            "matched_artists.artist.tracks": {
                $filter: {
                    input: "$matched_artists.artist.tracks",
                    cond: { $eq: ["$$this.search_name", "$track_search_name"]}
                } 
            }
        }
    },
    
    //unwinding into all release documents
    { $unwind: "$matched_artists.artist.tracks" },

    //restructure in clean document, we can filter on & project the wished fields from
    { $replaceWith: {
            release: {
                "title": "$track_title",
                "artist": "$artist_name",
                "release": "$matched_artists.artist.tracks.release" 
            } 
        }
    },

    //optional! filtering on year
    { $match: { "release.release.released": {$gte: 1901}}},

    //unwinding into release formats
    { $unwind: "$release.release.formats" },
    
    //optional filtering on format
    { $match: { "release.release.formats": "Vinyl" } },

    //group same releases
    { $group: {
        _id: {
            "release_id": "$release.release.release_id",
            "title": "$release.release.title",
            "formats":"$release.release.formats",
            "released":"$release.release.released" 
        },
        no_of_tracks: {$sum: 1}
    }},

    //add the discogs marketplace link
    { $addFields: {
            "url": {
                $concat: ["discogs.com/sell/release/", { $toString: "$_id.release_id" }]
            }
        }
    },

    //sort by no_of_tracks
    { $sort: { "no_of_tracks": -1 } },

    //project to desired output
    { $project: {
            "_id": 0,
            "Release Title": "$_id.title",
            "Format": "$_id.formats",
            "Release Year": "$_id.released",
            "Tracks from Playlist in Release": "$no_of_tracks",
            "Buy on Discogs": "$url"
        }
    }
])