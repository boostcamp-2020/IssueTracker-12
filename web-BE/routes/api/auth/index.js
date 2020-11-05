const router = require('express').Router();
const authController = require('./controller');

router.get('/oauth', authController.getUserInfo);
router.get('/:social/:username', authController.checkUser);

module.exports = router;