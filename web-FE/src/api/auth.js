import axios from 'axios';

const clientId = process.env.CLIENT_ID;
const clientSecret = process.env.CLIENT_SECRET;

export const saveUser = async ({ username, social }) => {
  const apiurl = 'http://localhost:8080/api/auth';
  const { insertUserId } = await axios.post(apiurl, { username, social });
};

export const getUserInfo = async (code) => {
  const apiurl = 'http://localhost:8080/api/auth/oauth';
  try {
    const result = await axios.get(
      `${apiurl}?code=${code}&client_id=${clientId}&client_secret=${clientSecret}`,
    );
    const { userInfo, isExistUser } = result.data;
    return { userInfo, isExistUser };
  } catch (error) {
    console.error(error);
  }
};

export const linkToGetCode = async () => {
  window.location.href = `https://github.com/login/oauth/authorize?client_id=${clientId}`;
};
