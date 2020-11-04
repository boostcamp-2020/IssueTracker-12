const router = require('express').Router();
const testController = require('./testController');

router.get('/', testController.read);

module.exports = router;
