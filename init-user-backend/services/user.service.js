const User = require('../models/user.model')



/**
 * redirect to model 
 */
exports.getUsers =  function (param, success, error) {
    
    User.getUsers((param),
        (result) => {
            success(result)
        },
        (err) => {
            error(err)
        }
    )
}



/**
 * redirect to model 
 */
exports.deleteUser =  function (param, success, error) {
    User.deleteUser((param),
        (result) => {
            success(result)
        },
        (err) => {
            error(err)
        }
    )
}
