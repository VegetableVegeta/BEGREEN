/* ----------------------------------------------------------- 
REQUIRE */

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors')
const app = express();
const http = require ('http');
const axios = require('axios')
require('dotenv').config();
const os = require('os');


/* ----------------------------------------------------------- 
IMPORT */

const wikiRouter = require('./routes/wiki.route');

/* ----------------------------------------------------------- 
MIDDLEWARE */

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

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

app.use('/dashboard/wiki', wikiRouter);

/* ----------------------------------------------------------- 
ROUTE VERS CE BACKEND NODE */


app.get('/', (req, res) => {
  console.log("req sended ...");
  res.send('<h1>Hello World</h1>');
});

app.get('/wiki', (req, res) => {
  res.json({ username: 'Flavio' })
})

app.post('/plant', (req, res) => {
  res.send('welcome, ' + req.body.name)
  console.log(req.body)
  res.end();
})


app.listen(process.env.NODE_SERVER_PORT, process.env.NODE_SERVER_HOST);
console.log(`Node is running ! -----------------------------------------------------------------`);




