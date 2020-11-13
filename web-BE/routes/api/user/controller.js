const authModel = require("../../../models/auth");

const userController = {
  read: async (req, res) => {
    const userArr = await authModel.selectAll();
    res.status(200).json({ userArray: userArr });
  },
};

module.exports = userController;
