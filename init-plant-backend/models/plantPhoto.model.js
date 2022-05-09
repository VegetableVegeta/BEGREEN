const mysql = require('mysql');

let pool  = mysql.createPool({
    connectionLimit : 10,
    host            : process.env.MSQL_PLANT_DB_HOST,
    user            : process.env.MSQL_PLANT_DB_ADMIN,
    password        : process.env.MSQL_PLANT_DB_ADMIN_PASSWORD,
    database        : process.env.MSQL_PLANT_DB_DATABASE
  });

exports.getPlantPhotos = function (param, success, error) {

    let plantId = param;

    pool.query(`SELECT * FROM Plantphoto WHERE plant_id = ${plantId}`, function (err, result) {
        if (err) {
            console.log(err.message)
          //error(err);
        } else {
          let photos = JSON.parse(JSON.stringify(result));
          success(photos);
        }
      } );

}