const passport = require("passport");
const passportJWT = require("passport-jwt");

const JWTStrategy = passportJWT.Strategy;
const ExtractJWT = passportJWT.ExtractJwt;
const LocalStrategy = require("passport-local").Strategy;
const userModel = require("../models/auth");

require("dotenv").config();

const passportLocalConfig = {
  usernameField: "username",
  passwordField: "password",
  session: false,
};

const passportVerify = (social) => async (username, password, done) => {
  const user = await userModel.select(username, social);
  if (!user) {
    return done(null, false);
  }
  return done(null, user);
};

const passportGithubVerify = passportVerify("github");
const passportAppleVerify = passportVerify("apple");

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

const passportGithubStrategy = new LocalStrategy(
  passportLocalConfig,
  passportGithubVerify
);
const passportAppleStrategy = new LocalStrategy(
  passportLocalConfig,
  passportAppleVerify
);
const jwtStrategy = new JWTStrategy(jwtConfig, jwtVerify);

module.exports = () => {
  passport.use("githubLocal", passportGithubStrategy);
  passport.use("appleLocal", passportAppleStrategy);
  passport.use("jwt", jwtStrategy);
};
