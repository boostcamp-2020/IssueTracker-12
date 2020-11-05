const router = require('express').Router({ mergeParams: true });
const commentController = require('./controller');

router.post('/', commentController.create);
router.get('/', commentController.read);
router.patch('/:commentId', commentController.update);

module.exports = router;
