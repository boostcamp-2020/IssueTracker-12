const router = require("express").Router();
const authController = require("./controller");
const passport = require("passport");

router.get("/oauth", authController.getUserInfo);
router.post("/check", authController.getUserInfoByUsername);
router.post("/", authController.addUser);
router.post("/token", authController.getToken);
router.get(
  "/",
  passport.authenticate("jwt", { session: false }),
  (req, res) => {
    res.status(200).json(req.user);
  }
);

module.exports = router;
