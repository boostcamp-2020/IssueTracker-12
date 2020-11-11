import axios from 'axios';

const instance = axios.create({
  baseURL: 'http://101.101.217.148:8080',
  // baseURL: 'http://localhost:8080',
  timeout: 1000,
  headers: { Authorization: `Bearer ${process.env.TOKEN}` },
});

export default instance;
