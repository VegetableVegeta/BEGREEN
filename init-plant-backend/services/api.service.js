const PlantService = require('../services/plant.service')
const PlantPhotoService = require('../services/plantPhoto.service')


// fetch all plants
exports.getPlants =  function (param, success, error) {
    
    PlantService.getPlants((param),

        // result from plant service, result is a json object of plants
        (result) => {


            const allPlants = async (result) => {
                const plants = []
              
                for (const plant of result) {
                    console.log('------ ITERATION ----')
                    const plantPhoto = await fetchPlantPhotoURL(plant)
                    plants.push(plantPhoto)
                    console.log(` --------------post traitement  plant id ${plant.id}`)
                }
                return plants

              }

        //success( allPlants(result))
        success(result)

        },
        (err) => {
            error(err)
        }      
    )
};

const fetchPlantPhotoURL = async (plant) => {
    console.log(`fetch Url on plant ${plant.id}`)

    PlantPhotoService.getPlantPhotos(
        plant.id, 
        (dataPhoto) => { 
            plant['pictures'] = createPlantPhotoObject(dataPhoto)
        },
        (error) => {}
    )
};


function createPlantPhotoObject(pictures){
    let picturesArray = [];
    pictures.forEach(picture => {
        picturesArray.push({"url" : picture.url});
        console.log(`ici trop lent`);
    });
    return picturesArray
}


// fetch one plant based on its id
exports.getPlant =  function (param, success, error) {
    
    const plantId = param.query.id;

    PlantService.getPlant((plantId),

        
        (result) => {
            success(result)

        },
        (err) => {
            error(err)
        }      
    )
}

// fetch one plant based on its id
exports.newPlant =  function (param, success, error) {

    PlantService.newPlant((param),        
        (result) => {
            success(result)
        },
        (err) => {
            error(err)
        }      
    )
}

// Delete plant based on its id
exports.deletePlant =  function (param, success, error) {

    PlantService.deletePlant((param),        
        (result) => {
            success(result)
        },
        (err) => {
            error(err)
        }      
    )
}

// update plant based on its id
exports.updatePlant =  function (param, success, error) {

    PlantService.updatePlant((param),        
        (result) => {
            success(result)
        },
        (err) => {
            error(err)
        }      
    )
}

// retrieved plant of the same familly - fetch by familly_id
exports.getPlantSameFamilly =  function (param, success, error) {

    PlantService.getPlantSameFamilly((param),        
        (result) => {
            success(result)
        },
        (err) => {
            error(err)
        }      
    )
}

// retrieved a list of all plant familly name
exports.getPlantFamilies =  function (param, success, error) {

    PlantService.getPlantFamilies((param),        
        (result) => {
            success(result)
        },
        (err) => {
            error(err)
        }      
    )
}