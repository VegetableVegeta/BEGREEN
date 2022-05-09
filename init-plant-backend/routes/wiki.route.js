const express = require('express');
const router = express.Router();

const PlantController = require('../controllers/plant.controller')

// fetch all plants
router.get('/plants', PlantController.getPlants)
// fetch one plant by its id
router.get('/plant?:id', PlantController.getPlant)
// create a new plant
router.post('/plant', PlantController.newPlant)
// update one plant by its id
router.put('/plant?:id', PlantController.updatePlant)
// delete plant based on its id
router.delete('/plant?:id', PlantController.deletePlant)
// fetch a list of plants by the familly using family id
router.get('/family?:id', PlantController.getPlantSameFamilly)
// fetch all plant families
router.get('/fam', PlantController.getPlantFamilies)

module.exports = router;


