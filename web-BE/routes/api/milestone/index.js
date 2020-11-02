<<<<<<< Updated upstream
const router = require('express').Router();
const milestoneController = require('./controller');

router.post('/', milestoneController.create);
router.get('/', milestoneController.read);
router.put('/:milestoneid', milestoneController.update);
router.delete('/:milestoneid', milestoneController.delete);

module.exports = router;
=======
>>>>>>> Stashed changes
