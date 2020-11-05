const authModel = require('../../../models/auth');
const axios = require('axios');

const authController = {
  checkUser: async ({username, social, url}) => {
  // checkUser: async (req, res) => {
  //   const { social, username } = req.params;
    const user = await authModel.select(username, social);
    if (!user) return false
    return true
    // if (!user) return res.sendStatus(401);
    // return res.sendStatus(200);
  },

  getUserInfo: async (req, res) => {
    const { code, client_id, client_secret } = req.query;
    const getTokenUrl = `https://github.com/login/oauth/access_token`;
    const getUserDataUrl = 'https://api.github.com/user';
    const reg = /access_token=(.*)&scope/;

    try { 
      const result = await axios.post(getTokenUrl, null, {
        params: { client_id, client_secret, code }
      })

      const token = reg.exec(result.data)[1]
      const { data : userData } = await axios({
        method: 'get',
        url: getUserDataUrl,
        headers: { Authorization: `token ${token}` }
      })

      const { login:username, url } = userData
      const userInfo = { username, social:'github' ,url }
      const isExistUser = await authController.checkUser(userInfo)
      res.json({ userInfo, isExistUser });
    } 
    catch (error) { console.error(error); }
 }

};

module.exports = authController;