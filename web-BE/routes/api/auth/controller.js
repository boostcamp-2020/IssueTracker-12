const authModel = require('../../../models/auth');

const authController = {
  checkUser: async (req, res) => {
    const { social, username } = req.params;
    const user = await authModel.select(username, social);
    if (!user) return res.sendStatus(401);
    return res.sendStatus(200);
  },
};

module.exports = authController;
