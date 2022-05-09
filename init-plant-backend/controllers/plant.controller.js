const ApiService = require('../services/api.service')

// fetch all plants
exports.getPlants = function (req, res, next) {

    ApiService.getPlants((req.param),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: "Succesfully Plants Retrieved ok"});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}   


// fetch one plant based on its id
exports.getPlant = function (req, res, next) {

    const id = req.query.id

    ApiService.getPlant((req),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: "Succesfully Plant Retrieved ok "});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}   

exports.newPlant = function (req, res, next) {
    
    ApiService.newPlant((req),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: "New plant succesfully created"});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}

exports.deletePlant = function (req, res, next) {
    
    ApiService.deletePlant((req),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: "Plant succesfully deleted"});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}

exports.updatePlant = function (req, res, next) {
    
    ApiService.updatePlant((req),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: "Plant succesfully updated"});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}

exports.getPlantSameFamilly = function (req, res, next) {
    
    ApiService.getPlantSameFamilly((req),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: "Succesfully Retrieved Plant of the same familly ok "});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}

exports.getPlantFamilies = function (req, res, next) {
    
    ApiService.getPlantFamilies((req),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: "Succesfully Retrieved the list of plant Famillies"});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}

