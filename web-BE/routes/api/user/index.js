const router = require("express").Router();
const userController = require("./controller");

router.get("/", userController.read);

module.exports = router;
