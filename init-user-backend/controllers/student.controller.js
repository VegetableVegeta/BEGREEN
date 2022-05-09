const StudentService = require('../services/student.service')



/**
 *  Controller for getStudents , redirect to service 
 */
exports.getStudents =  function (req, res, next) {
    

    StudentService.getStudents((req.param),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: "Succesfully student Retrieved ok "});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}

/**
 * Controller for getStudent , redirect to service
 */
exports.getStudent = function (req, res, next) {

    const id = req.query.id; 
    
    StudentService.getStudent((req.query.id),
        (result) => {
            res.status(200).json({status: 200, data: result, message: "Succesfully tutor Retrieved ok "});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
    

}   

/**
 * Controller for createStudent , redirect to service 
 * 
 */
exports.createStudent = function (req, res, next) {

    StudentService.createStudent((req),
        (result) => {
            res.status(200).json({status: 200, data: result, message: "Succesfully tutor created ok "});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
     
    
}   

/**
 * Controller for deleteStudent  , redirect to Service
 */
exports.deleteStudent =  function (req, res, next) {

    const id = req.query.id; 

    StudentService.deleteStudent((req.query.id),
    (result) => {
        res.status(200).json({status: 200, data: result, message: "Succesfully deleted Student Retrieved ok "});
    },
    (error) => {
        res.status(400).json({ status: 400, message: error.message })
    }
);
    
}   


  