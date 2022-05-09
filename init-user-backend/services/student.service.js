const Student = require('../models/student.model')

/**
 * redirect to model 
 */ 
exports.getStudents =  function (param, success, error) {    
    
    Student.getStudents((param),
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
exports.getStudent =  function (param, success, error) {
    
    Student.getStudent((param),
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
exports.deleteStudent =  function (param, success, error) {
    
    Student.deleteStudent((param),
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
exports.updateStudent =  function (param, success, error) {
    
    Student.updateStudent((param),
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
exports.createStudent =  function (param, success, error) {
    
    Student.createStudent((param),
        (result) => {
            success(result)
        },
        (err) => {
            error(err)
        }
    )
}
 