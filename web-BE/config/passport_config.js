const passport = require('passport');
const passportJWT = require('passport-jwt');

const JWTStrategy = passportJWT.Strategy;
const ExtractJWT = passportJWT.ExtractJwt;
const userModel = require('../models/auth');

require('dotenv').config();

const jwtConfig = {
  jwtFromRequest: ExtractJWT.fromAuthHeaderAsBearerToken(),
  secretOrKey: process.env.JWT_SECRET,
};
const jwtVerify = async (jwtPayload, done) => {
  const { username, social } = jwtPayload;
  const user = await userModel.select(username, social);
  if (!user) {
    return done(null, false);
  }
  return done(null, user);
};

const jwtStrategy = new JWTStrategy(jwtConfig, jwtVerify);

module.exports = () => {
  passport.use('jwt', jwtStrategy);
};
