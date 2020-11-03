const router = require('express').Router();
const issueController = require('./controller');

router.post('/', issueController.create);
router.get('/', issueController.read);
router.patch('/:issueId/title', issueController.updateTitle);
router.post('/:issueId/milestone/:milestoneId', issueController.addMilestone);
router.delete('/:issueId/milestone/', issueController.deleteMilestone);
router.post('/:issueId/label/:labelId', issueController.addLabel);
router.delete('/:issueId/label/:labelId', issueController.deleteLabel);
// router.delete('/:labelid', issueController.delete);

module.exports = router;
