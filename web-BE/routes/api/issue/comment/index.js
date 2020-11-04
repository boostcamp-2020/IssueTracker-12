const router = require('express').Router({ mergeParams: true });
const commentController = require('./controller');

router.post('/', commentController.create);


module.exports = router;
