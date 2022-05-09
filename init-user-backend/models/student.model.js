const mysql = require('mysql');

// Connect to DataBase with .env parameters 

let pool  = mysql.createPool({
  connectionLimit : 100,
  host            : process.env.MSQL_USER_DB_HOST,
  user            : process.env.MSQL_USER_DB_ADMIN,
  password        : process.env.MSQL_USER_DB_ADMIN_PASSWORD,
  database        : process.env.MSQL_USER_DB_DATABASE
});



/** 
* Select  all Students
*@return if succes , return list of all User with role_id 1
*/
exports.getStudents = function (param, success, error) {

   
    pool.query("SELECT id, first_name, last_name, email  FROM user_db.User WHERE role_id = 1;", function (err, result) {
      if (err) {
        error(err);
      } else {
        let data = JSON.parse(JSON.stringify(result));  
        success(data);
      }
    } );
  
  }
  
  
/**
*Select One student
*@return if succes , return send the row selected
*@param {param} param id in request 
*/
  exports.getStudent =  function (param, success, error) {
  
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
* Delete selected row in DB
*@return succes if row is deleted
*@param {param} param id in the request body
*/
  exports.deleteStudent = function (param, success, error) {
    
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
*update selected row 
*@return if succes , return confirm 
*@params param id 
*/
  exports.updateStudent =  function (param, success, error) {
    
    const id = param;
    
    pool.query(`SELECT FROM user_db.User WHERE id = ${id}`, function (err, result) {
      if (err) {
        res.send('Student updaté');
      } else {
        let data = JSON.parse(JSON.stringify(result));  
        success(data);
      }
    } );
  }
  






/** 
*Create a New Student in User Table
*@return  if succes , return confirmation of creation 
*@param {param} param data of request
*/
exports.createStudent =  function (param, success, error) {
  
  // Creation of password with the user name  in "param"
  const password = () => {
    const password_first = param.body.formValue.first_name;
    const password_last = param.body.formValue.last_name;
    let data = password_first+ `.` + password_last+ `.` + 1234;
    return(data);
  }

  // Creation of email with the user name 
  const email = () => {
    const email_first = param.body.formValue.first_name.toLowerCase();
    const email_last = param.body.formValue.last_name.toLowerCase();
    const data_email = email_first.substr(0, 1);
    let data = `BGN.` + data_email + `.` + email_last + `@fondespierre.com`;
    
    return(data);
  }

  // Recuperation of promotion id 
  const number = () => {

    const promotion = param.body.formValue.promotion_id;
    console.log(promotion);
    const test = parseInt(promotion, 10);
     return (test);
 }


  // create the object with the data recieved in Params
  const  createStudent = {
        "first_name": param.body.formValue.first_name.toLowerCase(),
        "last_name": param.body.formValue.last_name.toLowerCase(),
        "email": email(),
        "password":  password(),
        "first_connect": 0,
        "role_id": 1,
        "promotion_id": number()
    }

  // SQL request to insert a new Promotion
  pool.query(`INSERT INTO user_db.User SET ?`, createStudent, function (err, result) {

    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));
      success(data);
    }
  });

  }