const axios = require('axios');

const testController = {
  read: async (req, res) => {
    const { code, client_id, client_secret } = req.query;
    const url = `https://github.com/login/oauth/access_token`
    try {
        const result = await axios.post(url, null, {
            params: {
                client_id,
                client_secret,
                code
            }
        })
        const reg = /access_token=(.*)&scope/
        const token = reg.exec(result.data)[1]
        const getUserDataUrl = 'https://api.github.com/user'
        const { data } = await axios({
            method: 'get',
            url: getUserDataUrl,
            headers: {
                Authorization: `token ${token}`
            }
        })
        res.json({ userInfo : data });
    } catch (error) {
        console.error(error);
    }
 }
}

module.exports = testController;