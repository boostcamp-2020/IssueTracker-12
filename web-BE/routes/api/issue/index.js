const router = require('express').Router();
const issueController = require('./controller');

router.post('/', issueController.create);
// router.get('/', issueController.read);
// router.put('/:labelid', issueController.update);
// router.delete('/:labelid', issueController.delete);

module.exports = router;
