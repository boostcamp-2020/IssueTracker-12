const router = require("express").Router();
const aIssueController = require("./controller");

router.get("/", aIssueController.readById);

module.exports = router;
