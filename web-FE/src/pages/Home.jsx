import React, { useEffect } from "react";
import axios from "axios";

const App = () => {
  const clientId = process.env.CLIENT_ID
  const clientSecret = process.env.CLIENT_SECRET

  const getUserInfo = async (code) => {
    const apiurl = "http://localhost:8080/api/auth/oauth"
    try{
      const result = await axios.get(
        `${apiurl}?code=${code}&client_id=${clientId}&client_secret=${clientSecret}`
        );
      const {userInfo, isExistUser} = result.data
      console.log(userInfo, isExistUser)
    } catch(error){
      console.error(error)
    }
  };

  const linkTo = async () => {
    window.location.href =
      `https://github.com/login/oauth/authorize?client_id=${clientId}`;
  };

  useEffect(() => {
    const reg = /.code=(.*)/
    if(reg.test(window.location)){
      const code = reg.exec(window.location)[1]
      localStorage.setItem("test", code);
      getUserInfo(code)
    }
  });

  return <button onClick={linkTo}>GITHUB</button>;
};


export default App;