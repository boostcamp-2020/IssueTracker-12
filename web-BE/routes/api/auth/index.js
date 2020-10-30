const router = require('express').Router();
const authController = require('./controller');

router.post('/:social', authController.login);

module.exports = router;
