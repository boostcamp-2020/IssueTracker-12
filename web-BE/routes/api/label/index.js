const router = require('express').Router();
const labelController = require('./controller');

router.post('/', labelController.create);
router.get('/', labelController.read);
router.patch('/', labelController.update);
router.delete('/:labelid', labelController.delete);

module.exports = router;
