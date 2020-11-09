const authModel = require("../../../models/auth");
const axios = require("axios");
const jwt = require("jsonwebtoken");
const passport = require("passport");

const authController = {
  addUser: async (req, res) => {
    const { username, social } = req.body;
    const insertUserId = await authModel.insert(username, social);
    res.status(200).json({ insertUserId });
  },

  checkUser: async ({ username, social, url }) => {
    const user = await authModel.select(username, social);
    if (!user) return false;
    return true;
  },

  getUserInfo: async (req, res) => {
    const { code, client_id, client_secret } = req.query;
    const getTokenUrl = `https://github.com/login/oauth/access_token`;
    const getUserDataUrl = "https://api.github.com/user";
    const reg = /access_token=(.*)&scope/;

    try {
      const result = await axios.post(getTokenUrl, null, {
        params: { client_id, client_secret, code },
      });

      const token = reg.exec(result.data)[1];
      const { data: userData } = await axios({
        method: "get",
        url: getUserDataUrl,
        headers: { Authorization: `token ${token}` },
      });

      const { login: username, url } = userData;
      const userInfo = { username, social: "github", url };
      const isExistUser = await authController.checkUser(userInfo);
      res.json({ userInfo, isExistUser });
    } catch (error) {
      next(error);
    }
  },

  getToken: (req, res) => {
    passport.authenticate("local", { session: false }, (err, user) => {
      if (err || !user) {
        return res.status(400).json({
          message: "Something is not right",
          user: user,
        });
      }
      req.login(user, { session: false }, (err) => {
        if (err) {
          res.send(err);
        }
        // jwt.sign('token내용', 'JWT secretkey')
        const token = jwt.sign(user.toJSON(), process.env.JWT_SECRET);
        return res.json({ user, token });
      });
    })(req, res);
  },
};

module.exports = authController;
