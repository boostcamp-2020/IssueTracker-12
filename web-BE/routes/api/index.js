const router = require('express').Router();
const test = require('./test');
const label = require('./label');

router.use('/test', test);
router.use('/label',label)

module.exports = router;
