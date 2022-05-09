const mysql = require('mysql');

let con = mysql.createConnection({
  host: process.env.MSQL_PLANT_DB_HOST,
  user: process.env.MSQL_PLANT_DB_ADMIN,
  password: process.env.MSQL_PLANT_DB_ADMIN_PASSWORD,
  database: process.env.MSQL_PLANT_DB_DATABASE
});

// Create connection to the db
let pool  = mysql.createPool({
  connectionLimit : 10,
  host            : process.env.MSQL_PLANT_DB_HOST,
  user            : process.env.MSQL_PLANT_DB_ADMIN,
  password        : process.env.MSQL_PLANT_DB_ADMIN_PASSWORD,
  database        : process.env.MSQL_PLANT_DB_DATABASE
});


// fetch all plants with status published / status_is = 3
exports.getPlants = async function (param, success, error) {

  pool.query("SELECT * FROM Plant WHERE status_id = 3 LIMIT 24", function (err, result) {
    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));
      success(data);
    }
  });
}


// fetch one plant based on its id
exports.getPlant = async function (param, success, error) {

  let id = param;

  pool.query(`SELECT * FROM Plant WHERE id = ${id}`, function (err, result) {
    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));

      if (data.length != 1){
        success('no data')
      } else {
        success(data);
      }
    }
  });
}

// Save a new plant in DB - data coming from newPlant Form
exports.newPlant = async function (param, success, error) {

  // create the object with the data recieved in Params
  const newPlant = {
        "name": param.body.formValue.name,
        "latin_name": param.body.formValue.latin_name,
        "description": param.body.formValue.description,
        "origin": param.body.formValue.origin,
        "flowering": param.body.formValue.flowering,
        "foliage": param.body.formValue.foliage,
        "plantation_period": param.body.formValue.plantation_period,
        "plantation_location": param.body.formValue.plantation_location,
        "published_date": null,
        "creator_id": 1,
        "review": param.body.formValue.review,
        "reviewer_id": null,
        "family_id": 1,
        "status_id": 2
    }
    
  // SQL request to insert a new plant
  pool.query(`INSERT INTO Plant SET ?`, newPlant, function (err, result) {

    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));
      success(data);
    }
  });
}

// delete one plant based on its id
exports.deletePlant = async function (param, success, error) {

  let id = param.query.id;

  pool.query(`DELETE FROM Plant WHERE id = ${id}`, function (err, result) {
    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));
        success(data);
    }
  });
}

// update one plant based on its id
exports.updatePlant = async function (param, success, error) {

  const id = param.query.id;
  let plant = param.body.formValue;
  console.log(plant);

  pool.query(`UPDATE Plant SET name = '${plant.name}', latin_name = '${plant.latin_name}',
  description = '${plant.description}', origin = '${plant.origin}',
  flowering = '${plant.flowering}', foliage = '${plant.foliage}',
  plantation_period = '${plant.plantation_period}', plantation_location = '${plant.plantation_location}',
  family_id = '${plant.family_id}'
    WHERE id = ${plant.id}`, function (err, result) {
  if (err) {
    error(err);
  } else {
    let data = JSON.parse(JSON.stringify(result));
    success(data);
  }
  });
}

// retrieved 6 plants of the same familly - fetch by familly_id
exports.getPlantSameFamilly = async function (param, success, error) {

  const plantId = param.query.id;
  const familyId = param.query.familyid;

  pool.query(`SELECT * FROM Plant WHERE NOT id = ${plantId} AND family_id = ${familyId} LIMIT 6`, function (err, result) {
    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));
      success(data);
    }
  });
}

// retrieveda a lits of all plant famlilly name and id - ordered by name Asc
exports.getPlantFamilies = async function (param, success, error) {

  pool.query(`SELECT id, name FROM Familly ORDER BY name ASC`, function (err, result) {
    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));
      success(data);
    }
  });
}