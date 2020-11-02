const router = require('express').Router();
const labelController = require('./controller');

router.post('/', labelController.create);
router.get('/', labelController.read);
router.put('/:labelid', labelController.update);
router.delete('/:labelid', labelController.delete);

module.exports = router;
