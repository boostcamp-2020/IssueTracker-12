const express = require('express');
const router = require('./routes/index');
const cors = require('cors');

require('dotenv').config();

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cors({origin: true, credentials: true}));

app.use('/', router);

const server = app.listen(8080, () => {
  const { port } = server.address();

  console.log('Server is working on port', port);
});
