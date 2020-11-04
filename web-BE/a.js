const axios = require('axios');
const fs = require('fs');

const url = 'https://github.com/login/oauth/access_token';
const client_id = '62df6a26dc0a1fe0cc55';
const client_secret = 'c1ab1b4d9d6ef0536f31d8156c68174eecff673f';
const code = '48661d313722cf240aa5';

const result = axios.post(url, null, {
  params: {
    client_id,
    client_secret,
    code,
  },
})
.then(res => {
  console.log(res.data);
})
.catch(err => {
  // console.error(err.data);
  fs.writeFileSync("target.html", '\ufeff' + err.response.data, {encoding: 'utf8'});
})
