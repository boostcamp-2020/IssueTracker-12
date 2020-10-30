const passport = require('passport');
const jwt = require('jsonwebtoken');

const authController = {
  login: (req, res, next) => {
    const { social } = req.params;
    passport.authenticate(`${social}Local`, { session: false }, (passportError, user) => {
      if (!user) return res.sendStatus(401);
      if (passportError) return res.sendStatus(400);
      const token = jwt.sign({ ...user }, process.env.JWT_SECRET);
      return res.status(200).json(token);
    })(req, res);
  },
};

module.exports = authController;
