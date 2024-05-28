use('dtos')

db.spotify_users2.aggregate([
    //find the user in the spotify DB
    { $match: { "spotify_user.username": "TheKetio" } },

    //unwind all user playlists
    {$unwind: "$spotify_user.playlists"},

    //match only the selected playlist
    { $match: { "spotify_user.playlists.name": "diesdas" } },

    //unwind all playlist tracks
    { $unwind: "$spotify_user.playlists.playlist_tracks" },

    //optional! filter by track by removing all documents not having the selected track name 
    { $match: { "spotify_user.playlists.playlist_tracks.track_title": "House of the Rising Sun" } },
    
    //set the playlist tracks as new root to flatten the structure
    { $replaceRoot: { newRoot: "$spotify_user.playlists.playlist_tracks" } },

    //lookup possible artists foreach track. If we can't find any objects here, this means the requested artist is not stored in our database.
    { $lookup: {
          from: "artists2",
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
    
    //one last unwinding into all release documents
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
    { $match: { "release.release.released": {$gte: 1999}}},

    //optional filtering on format
    { $match: { "release.release.formats": { $in: ["CD"] } } }
    
    //will add the project stage, as needed in metabase
])