const express = require("express");
const router = require("./routes/index");

require("dotenv").config();

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use("/", router);

const server = app.listen(3000, () => {
  const { port } = server.address();

  console.log("Server is working on port", port);
});
