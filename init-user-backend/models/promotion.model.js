const mysql = require('mysql');




/**
 * Connection to DataBase with .env parameters 
 */
const pool  = mysql.createPool({
  connectionLimit : 100,
  host            : process.env.MSQL_USER_DB_HOST,
  user            : process.env.MSQL_USER_DB_ADMIN,
  password        : process.env.MSQL_USER_DB_ADMIN_PASSWORD,
  database        : process.env.MSQL_USER_DB_DATABASE
});


/**
 * Select all user with a promotion
 * @return a list of users with promotion_id
*/
exports.getPromotions = function (param, success, error) {
  pool.query("SELECT User.id, User.first_name, User.last_name, User.email, Promotion.title FROM user_db.User JOIN user_db.Promotion ON User.promotion_id = Promotion.id;", function (err, result) {
    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));  
      success(data);
    }
  } );
}


/**
 *  Select  all promotions 
 * @Return a list of promotions 
 */
exports.getListPromotion = function (param, success, error) {
  pool.query("SELECT id, title, year FROM user_db.Promotion ;", function (err, result) {
    if (err) {
      error(err);
    } else {
      let data = JSON.parse(JSON.stringify(result));  
      success(data);
    }
  } );
}



/**
 * Create a new promotion with params in post 
 * @return if succes, return confirm 
 * @param {param} param data of post request 
 * 
 */
  exports.newPromotion =  function (param, success, error) {

    // create the object with the data recieved in Params
    const newPromotion = {
          "title": param.body.formValue.title,
          "year": param.body.formValue.year
      }
      
    // SQL request to insert a new Promotion
    pool.query(`INSERT INTO user_db.Promotion SET ?`, newPromotion, function (err, result) {
  
      if (err) {
        error(err);
      } else {
        let data = JSON.parse(JSON.stringify(result));
        success(data);
      }
    });

  }
  

/** 
* Delete selected Promotion with her id 
*@return if succes return confirm of delete
*@param param id of promotion to delete
*/
  exports.deletePromotion = function (param, success, error) {
  
    const id = param;
    pool.query(`DELETE FROM user_db.Promotion WHERE id = ${id}`, function (err, result) {
      if (err) {
        res.send('promotion supprimé');
      } else {
        let data = JSON.parse(JSON.stringify(result));  
        success(data);
      }
    } ); 
  }