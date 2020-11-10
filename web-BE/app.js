const createError = require("http-errors");
const express = require("express");
const logger = require("morgan");
const cookieParser = require("cookie-parser");
const passport = require("passport");
const cors = require("cors");
const passportConfig = require("./config/passport_config");

const router = require("./routes/index");

require("dotenv").config();

const app = express();

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(passport.initialize());
app.use(cors({ origin: true, credentials: true }));
passportConfig();

app.use("/", router);

app.use((req, res, next) => {
  next(createError(404));
});

app.use((err, req, res, next) => {
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  res.status(err.status || 500);
  res.json(err.message);
});

const server = app.listen(8080, () => {
  const { port } = server.address();

  console.log("Server is working on port", port);
});
