const router = require("express").Router();
const authController = require("./controller");

router.get("/oauth", authController.getUserInfo);
router.post("/", authController.addUser);
router.post("/token", authController.getToken);

module.exports = router;
