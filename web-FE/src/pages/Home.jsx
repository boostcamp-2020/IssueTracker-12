import React, { useState, useEffect, useRef } from "react";
// import { Link } from "react-router-dom";
import axios from "axios";
// import useLocation from "./uselocation";

// import path from "path";
// import dotenv from "dotenv";

// dotenv.config({ path: path.join(path.resolve(), ".env") });
// console.log(process.env.CLIENT_ID);

// TODO : 로그인 링크로 보내기
// https://github.com/login/oauth/authorize?client_id=62df6a26dc0a1fe0cc55]
// TODO : redirect -> uri 가져오기 (code 얻기)
// TODO : code, client id, client secret 포함해서 post 하기
// TODO : 가져온 정보 저장하기


const App = () => {

  const getAccessToken = async (code) => {
    const client_id = "62df6a26dc0a1fe0cc55";
    const client_secret = "c1ab1b4d9d6ef0536f31d8156c68174eecff673f";
    // try{

    // } catch(error){
    //   console.error(error)
    // }
    
    const result = await axios.get(
       `http://localhost:8080/api/test?code=${code}&client_id=${client_id}&client_secret=${client_secret}`
    );
    const {userInfo} = result.data
    console.log(userInfo)
  };

  const linkTo = async () => {
    window.location.href =
      "https://github.com/login/oauth/authorize?client_id=62df6a26dc0a1fe0cc55";
  };

  useEffect(() => {
    const reg = /.code=(.*)/
    if(reg.test(window.location)){
      const code = reg.exec(window.location)[1]
      localStorage.setItem("test", code);
      getAccessToken(code)
    }
  });

  return <button onClick={linkTo}>GITHUB</button>;
};

export default App;
