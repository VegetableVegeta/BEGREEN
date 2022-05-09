/* ----------------------------------------------------------- 
REQUIRE */

const express = require('express');
const bodyParser = require('body-parser');
var cors = require('cors')
const app = express();
const mysql = require('mysql');
const axios = require('axios')
require('dotenv').config();
const os = require('os');

/* ----------------------------------------------------------- 
IMPORT */


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));


//const indexRouter = require('./routes/index');
const usersRouter = require('./routes/user.route');
const promotionsRouter= require('./routes/promotion.route');
const tutorsRouter = require('./routes/tutor.route');
const studentsRouter = require('./routes/student.route');
/* ----------------------------------------------------------- 
MIDDLEWARE */   

app.use((req, res, next) => {
  // allow different IP address
  res.setHeader('Access-Control-Allow-Origin', '*');
  // allow different header field 
  res.header('Access-Control-Allow-Headers', '*');
  res.header('Access-Control-Allow-Methods', 'POST, PUT, GET, OPTIONS');
  next();
});

app.use(cors())


/* ----------------------------------------------------------- 
ROUTER */

// app.use('/', indexRouter);
app.use('/dashboard', usersRouter);
app.use('/dashboard', promotionsRouter);
app.use('/dashboard', tutorsRouter);
app.use('/dashboard', studentsRouter);


/* ----------------------------------------------------------- 
/* ----------------------------------------------------------- 
SERVER INFO VIA OS */
const networkInterfaces = os.networkInterfaces();
console.log(networkInterfaces);
/* ----------------------------------------------------------- 
ROUTE VERS CE BACKEND NODE */
app.get('/', (req, res) => {
  console.log("response sended ...");
  res.json({ username: 'Flavio' })
  res.send('<h1>Hello World</h1>');
});
/* ----------------------------------------------------------- 
NODE EXPRESS SERVER */
 app.listen(process.env.NODE_SERVER_PORT, process.env.NODE_SERVER_HOST);
 console.log(`Node is running !`);
 
