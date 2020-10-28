var router = require('express').Router();
var api = require('./api/index')

router.use('/api', api)

module.exports = router;