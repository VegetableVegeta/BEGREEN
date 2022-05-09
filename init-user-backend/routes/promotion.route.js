const express = require('express');
const router = express.Router();



// Router  for promotion redirect to Promotion Controller
const PromotionController = require('../controllers/promotion.controller');
router.get('/promotions', PromotionController.getPromotions);
router.delete('/promotion?:id' , PromotionController.deletePromotion);
router.post('/promotion' , PromotionController.newPromotion);
router.get('/listpromotion' , PromotionController.getListPromotion);
module.exports = router;
