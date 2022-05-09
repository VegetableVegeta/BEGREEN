const express = require('express');
const router = express.Router();
const UserController = require('../controllers/user.controller')


// Router for User, redirect to User Controller 
router.get('/users', UserController.getUsers)
router.delete('/user?:id',UserController.deleteUser);

module.exports = router;