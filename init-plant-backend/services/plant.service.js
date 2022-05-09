const Plant = require('../models/plant.model')

exports.getPlants =  function (param, success, error) {
    
    Plant.getPlants((param),

        (result) => {
            success(result);
        },
        (err) => {
            error(err)
        }
    )
}

exports.getPlant =  function (param, success, error) {
    
    Plant.getPlant((param),

        (result) => {
            success(result);
        },
        (err) => {
            error(err)
        }
    )
}

exports.newPlant =  function (param, success, error) {
    Plant.newPlant((param),
        (result) => {
            success(result);
        },
        (err) => {
            error(err)
        }
    )
}

exports.deletePlant =  function (param, success, error) {
    Plant.deletePlant((param),
        (result) => {
            success(result);
        },
        (err) => {
            error(err)
        }
    )
}

exports.updatePlant =  function (param, success, error) {
    Plant.updatePlant((param),
        (result) => {
            success(result);
        },
        (err) => {
            error(err)
        }
    )
}

exports.getPlantSameFamilly =  function (param, success, error) {
    Plant.getPlantSameFamilly((param),
        (result) => {
            success(result);
        },
        (err) => {
            error(err)
        }
    )
}

exports.getPlantFamilies =  function (param, success, error) {
    Plant.getPlantFamilies((param),
        (result) => {
            success(result);
        },
        (err) => {
            error(err)
        }
    )
}

