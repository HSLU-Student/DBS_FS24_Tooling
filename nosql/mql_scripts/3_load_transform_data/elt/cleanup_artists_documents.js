//step 4
//use dtos db
use('dtos');

//cleanup artists document
db.artists.aggregate([
    {
        $project: {
            tracks: {
                _id: 0,
                release_id: 0,
                release: {
                    _id: 0,
                }
            }
        }
    }
])