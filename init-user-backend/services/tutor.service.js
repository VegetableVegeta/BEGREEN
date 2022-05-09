const Tutor = require('../models/tutor.model')



/**
 * redirect to model 
 */
exports.getTutors =  function (param, success, error) {
    
    Tutor.getTutors((param),
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
exports.getTutor =  function (param, success, error) {
    
    Tutor.getTutor((param),
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
exports.deleteTutors =  function (param, success, error) {
    
    Tutor.deleteTutors((param),
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
exports.updateTutor =  function (param, success, error) {
    
    Tutor.updateTutor((param),
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
exports.createTutor =  function (param, success, error) {
    
    Tutor.createTutor((param),
        (result) => {
            success(result)
        },
        (err) => {
            error(err)
        }
    )

}
 