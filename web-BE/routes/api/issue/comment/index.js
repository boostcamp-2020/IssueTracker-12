const router = require('express').Router({ mergeParams: true });
const commentController = require('./controller');

router.post('/', commentController.create);
router.get('/', commentController.read);

module.exports = router;
