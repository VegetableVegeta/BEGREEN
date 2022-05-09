const TutorService = require('../services/tutor.service')


/**
 *Controller for getTutors , redirect to service 
 */
exports.getTutors = function (req, res, next) {
    
    TutorService.getTutors((req.param),
        (result) => {
            res.status(200).json({status: 200, data: result, message: "Succesfully tutor Retrieved ok " });
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
         
}   


/**  
* Controller for getTutor, redirect to service
*/ 
exports.getTutor =  function (req, res, next) {

    const id = req.query.id; 

    TutorService.getTutor((req.query.id),
        (result) => {
            res.status(200).json({status: 200, data: result, message: "Succesfully tutor Retrieved ok "});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
    

}   
/** 
 * Controller for createTutor, redirect to service
 */ 
exports.createTutor = function (req, res, next) {

    TutorService.createTutor((req),
    (result) => {
        res.status(200).json({status: 200, data: result, message: "Succesfully tutor created ok "});
    },
    (error) => {
        res.status(400).json({ status: 400, message: error.message })
    }
    );
    
    
}   

/**
 *Controller for deleteTutors , redirect to service 
 */
exports.deleteTutors =  function (req, res, next) {

    const id = req.query.id; 

    TutorService.deleteTutors((req.query.id),
    (result) => {
        res.status(200).json({status: 200, data: result, message: "Succesfully deleted tutor Retrieved ok "});
    },
    (error) => {
        res.status(400).json({ status: 400, message: error.message })
    }
);
    
}   


/**
 * 
 * Controller for updateTutor, Redirect to Service 
 */
exports.updateTutor = function (req, res, next) {

    const id = req.query.id; 

    TutorService.updateTutor((req.query.id),
    (result) => {
        res.status(200).json({status: 200, data: result, message: "Succesfully updated tutor Retrieved ok "});
    },
    (error) => {
        res.status(400).json({ status: 400, message: error.message })
    }
)
}
  