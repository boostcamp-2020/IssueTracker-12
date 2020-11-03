const router = require('express').Router();
const issueController = require('./controller');

router.post('/', issueController.create);
router.get('/', issueController.read);
router.patch('/:issueId/title', issueController.updateTitle);
// router.delete('/:labelid', issueController.delete);

module.exports = router;
