const req = require('express/lib/request');
const res = require('express/lib/response');
const mysql = require('mysql');

let con = mysql.createConnection({
  host: process.env.MSQL_USER_DB_HOST,
  user: process.env.MSQL_USER_DB_ADMIN,
  password: process.env.MSQL_USER_DB_ADMIN_PASSWORD,
  database: process.env.MSQL_USER_DB_DATABASE
});

let pool  = mysql.createPool({
  connectionLimit : 10,
  host: process.env.MSQL_USER_DB_HOST,
  user: process.env.MSQL_USER_DB_ADMIN,
  password: process.env.MSQL_USER_DB_ADMIN_PASSWORD,
  database: process.env.MSQL_USER_DB_DATABASE
});


/**
 * Select one Tutor in User Table
 * @return if succes return all tutors of User Table
 * @param {param} param id in the request
 */
exports.getTutors =  function (param, success, error) {
  const id = param;
  pool.query("SELECT id, first_name, last_name, email  FROM user_db.User WHERE role_id = 2", function (err, result) {
    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));  
      success(data);
    }
  } );

}


/**
 * Select One Tutor by id in Tutor Table
 * @return  if succes , return selected row 
 * @param {param} param id in the request
 */
exports.getTutor = function (param, success, error) {

  const id = param;
  console.log(id);
  pool.query(`SELECT id, first_name, last_name, email  FROM user_db.User WHERE id = ${id}`, function (err, result) {
    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));  
      success(data);
    }
  } );

}
    
/**  
*Delete selected row in Tutor Table
*@return result if row is deleted
*@param {param} param id in the request body
*/
exports.deleteTutors = function (param, success, error) {
  
  const id = param;
  pool.query(`DELETE FROM user_db.User WHERE id = ${id}`, function (err, result) {
    if (err) {
      res.send('tutor supprimé');
    } else {
      let data = JSON.parse(JSON.stringify(result));  
      success(data);
    }
  } );
}

/**  
*Update selected fields in Tutor Table
*@return succes if field is update
*@param {param} param id in the request 
*/
exports.updateTutor = function (param, success, error) {
  
  const id = param;
  
  pool.query(`SELECT FROM user_db.User WHERE id = ${id}`, function (err, result) {
    if (err) {
      res.send('tutor updaté');
    } else {
      let data = JSON.parse(JSON.stringify(result));  
      success(data);
    }
  } );
}



/**
 * Create a new row in Tutor Table
 * @return if succes, return a confirm of creation of new tutor
 * @param {param} param 
 */
exports.createTutor = function (param, success, error) {


/**
 *Creation of password with param in the body request
 * @param {param} param data in the request body
 */
const password = () => {
  const password_first = param.body.formValue.first_name;
  const password_last = param.body.formValue.last_name;
  let data = password_first+ `.` + password_last+ `.` + 1234;
  console.log(data);
  return(data);
}


/**
 *Creation of email with param in the body request 
 * @return 
 * @param {param} param data in the request body
 */
const email = () => {
  const email_first = param.body.formValue.first_name.toLowerCase();
  const email_last = param.body.formValue.last_name.toLowerCase();
  const data_email = email_first.substr(0, 1);
  let data = `BGN.` + data_email + `.` + email_last + `@fondespierre.com`;
  
  return(data);
}

  // create the object with the data recieved in Params
  const  createTutor = {
        "first_name": param.body.formValue.first_name.toLowerCase(),
        "last_name": param.body.formValue.last_name.toLowerCase(),
        "email": email(),
        "password":  password(),
        "first_connect": 0,
        "role_id": 2,
        "promotion_id": null
    }
    // param.body.formValue.password
    console.log(password)
  // SQL request to insert a new Promotion
  pool.query(`INSERT INTO user_db.User SET ?`, createTutor, function (err, result) {

    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));
      success(data);
    }
  });
}

    