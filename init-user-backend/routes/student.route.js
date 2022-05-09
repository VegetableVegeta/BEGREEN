const express = require('express');
const router = express.Router();
const StudentController = require('../controllers/student.controller');


// Router for Students, redirect to Student Controller
router.get('/students', StudentController.getStudents);
router.post('/student', StudentController.createStudent);
router.delete('/student?:id', StudentController.deleteStudent);


module.exports = router;