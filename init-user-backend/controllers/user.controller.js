const UserService = require('../services/user.service')

exports.getUsers = function (req, res, next) {

    UserService.getUsers((req.param),
        (result) => {
            res.status(200).json({ status: 200, result, message: "Succesfully Users Retrieved ok "});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}   


     exports.deleteUser = function (req, res, next) {
        const id = req.query.id; 
   
       UserService.deleteUser((req.query.id),
       (result) => {
           res.status(200).json({status: 200, data: result, message: "Succesfully deleted tutor Retrieved ok "});
       },
       (error) => {
           res.status(400).json({ status: 400, message: error.message })
       }
   );
   }   
