const PromotionService = require('../services/promotion.service')

/**
 * controller for  function -> getpromotion ( response all promotions), redirect to Service
 */
exports.getPromotions =  function (req, res, next) {

    PromotionService.getPromotions((req.param),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: "Succesfully promotion Retrieved ok "});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}
/**
 * controller for Function -> new promotion ( create promotion), redirect to Service
 */
exports.newPromotion = function (req, res, next) {
    
    PromotionService.newPromotion((req),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: "New promotion succesfully created"});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}

/**
 * controller for function create a list of promotions , redirect to Service
 */
exports.getListPromotion = function (req, res, next) {
    
    PromotionService.getListPromotion((req),
        (result) => {
            res.status(200).json({ status: 200, data: result, message: " list of promotion succesfully created"});
        },
        (error) => {
            res.status(400).json({ status: 400, message: error.message })
        }
    );
}

/**
 * Controller for function -> delete a promotion, redirect to Service
 */
exports.deletePromotion = function (req, res, next) {
     const id = req.query.id; 

    PromotionService.deletePromotion((req.query.id),
    (result) => {
        res.status(200).json({status: 200, data: result, message: "Succesfully deleted tutor Retrieved ok "});
    },
    (error) => {
        res.status(400).json({ status: 400, message: error.message })
    }
);
}   

