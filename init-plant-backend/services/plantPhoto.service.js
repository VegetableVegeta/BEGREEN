const Picture = require('../models/plantPhoto.model')

exports.getPlantPhotos =  function (param, success, error) {
    
    Picture.getPlantPhotos((param),

        (result) => {
            success(result);
        },
        (err) => {
            error(err)
        }
    )
}


