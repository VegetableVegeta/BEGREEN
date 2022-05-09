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
 * Select two User in User Table 
 * @return if succes return 2 user
 */
exports.getUsers =  function (param, success, error) {

     
          pool.query("SELECT * FROM User LIMIT 2", function (err, result) {
            if (err) {
              error(err)
            } else {
              let data = JSON.parse(JSON.stringify(result));  
              success(data)
            }
            
          } );

}


/**
 * Delete selected User
 * @return if delete succes, return confirm 
 * @param {param} param id in request 
 */
exports.deleteUser =  function (param, success, error) {
  
  const id = param;
  pool.query(`DELETE FROM user_db.User WHERE id = ${id}`, function (err, result) {
    if (err) {
      res.send('promotion supprimé');
    } else {
      let data = JSON.parse(JSON.stringify(result));  
      success(data);
    }
  } ); 
}

