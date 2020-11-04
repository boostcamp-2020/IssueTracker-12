const router = require('express').Router();
const commentRouter = require('./comment');









router.use('/:issueId/comment', commentRouter);

module.exports = router;
