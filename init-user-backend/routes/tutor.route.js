const express = require('express');
const router = express.Router();

const TutorController = require('../controllers/tutor.controller')


// Router for Tutors , redirect to Tutor Controller 
router.get('/tutors', TutorController.getTutors)
router.post('/tutor', TutorController.createTutor)
router.delete('/tutor?:id', TutorController.deleteTutors)



module.exports = router;