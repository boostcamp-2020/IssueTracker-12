const router = require('express').Router({ mergeParams: true });
const milestoneController = require('./controller');

router.post('/', milestoneController.create);
router.get('/', milestoneController.read);
router.put('/:milestoneid', milestoneController.update);
router.delete('/:milestoneid', milestoneController.delete);
router.get(
  '/:milestoneid/issues',
  milestoneController.selectIssuesFromMilestone,
);

module.exports = router;
