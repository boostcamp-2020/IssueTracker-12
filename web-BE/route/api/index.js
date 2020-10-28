const router = require('express').Router();
const auth = require('./auth/index');
const comment = require('./comment/index');
const issue = require('./issue/index');
const label = require('./label/index');
const milestone = require('./milestone/index');

router.use('/auth', auth);
router.use('/comment', comment);
router.use('/issue', issue);
router.use('/label', label);
router.use('/milestone', milestone);

module.exports = router;
