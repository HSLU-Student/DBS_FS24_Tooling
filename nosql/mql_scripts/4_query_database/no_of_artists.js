use("dtos")
db.artists.countDocuments({}, {hint: "_id_"})