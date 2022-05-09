const Promotion = require('../models/promotion.model')



/**
 * redirect to model 
 */
exports.getPromotions =  function (param, success, error) {    
    Promotion.getPromotions((param),
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
exports.getListPromotion =  function (param, success, error) {    
    Promotion.getListPromotion((param),
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
exports.getPromotionById = function (param, sucess, error) {    

    Promotion.getPromotionById((param),
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
exports.deletePromotion =  function (param, success, error) {
    Promotion.deletePromotion((param),
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
exports.newPromotion =  function (param, success, error) {
    Promotion.newPromotion((param),
        (result) => {
            success(result);
        },
        (err) => {
            error(err)
        }
    )

}
