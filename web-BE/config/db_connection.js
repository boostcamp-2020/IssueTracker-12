const mysql = require('mysql2');
const path = require('path');
const dotenv = require('dotenv');
dotenv.config({ path: path.join( path.resolve(), '.env') });

const connection = mysql.createConnection({
    // TODO : 환경변수 설정하십시오!
    host: process.env.CONNECTION_HOST,
    user: process.env.CONNECTION_USER,
    password: process.env.CONNECTION_PW,
    database: 'IssueTracker',
    port: process.env.CONNECTION_PORT,
    connectionLimit : 50
  });

module.exports = connection;
