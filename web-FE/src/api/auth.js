import axios from 'axios';

const clientId = process.env.CLIENT_ID;
const clientSecret = process.env.CLIENT_SECRET;
const baseURL = 'http://101.101.217.148:8080';

export const saveUser = async (username, social) => {
  const apiurl = `${baseURL}/api/auth`;
  const { insertId } = await axios.post(apiurl, { username, social });
  return insertId;
};

export const getUserInfo = async (code) => {
  const apiurl = `${baseURL}/api/auth/oauth`;
  try {
    const result = await axios.post(apiurl, {
      code,
      client_id: clientId,
      client_secret: clientSecret
    });
    const { userInfo, isExistUser } = result.data;
    return { userInfo, isExistUser };
  } catch (error) {
    console.error(error);
  }
};

export const linkToGetCode = async () => {
  window.location.href = `https://github.com/login/oauth/authorize?client_id=${clientId}`;
};

export const signIn = async (username, social) => {
  const password = 'temppassword';
  const apiurl = `${baseURL}/api/auth/token`;
  try {
    const result = await axios.post(apiurl, { username, social, password });
    const { token } = result.data;
    localStorage.setItem('token', token);
    return;
  } catch (error) {
    console.error(error);
  }
};
