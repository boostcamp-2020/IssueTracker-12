import React from "react";
import axios from "axios";

const getAuthCode = async () => {
  const client_id = "62df6a26dc0a1fe0cc55";
  window.location.href = `https://github.com/login/oauth/authorize?client_id=${client_id}`;
  const authCode = /.code=(.*)/.exec(window.location)[1];
  return authCode;
};

const saveAuthCode = async () => {
  const authCode = await getAuthCode();
  localStorage.setItem("code", authCode);
  return authCode;
};

const getAccessToken = async () => {
  const authCode = await saveAuthCode();
  const client_id = "62df6a26dc0a1fe0cc55";
  const client_secret = "c1ab1b4d9d6ef0536f31d8156c68174eecff673f";
  const accessToken = await axios.post(
    `https://github.com/login/oauth/access_token?client_id=${client_id}&client_secret=${client_secret}&code=${authCode}`
  );
  localStorage.setItem("token", accessToken);
  return accessToken;
};

const test = () => {
  return <button onClick={getAccessToken}>jebal</button>;
};

export default test;
