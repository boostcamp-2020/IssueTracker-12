import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "axios";
import useLocation from "./uselocation";

// import path from "path";
// import dotenv from "dotenv";

// dotenv.config({ path: path.join(path.resolve(), ".env") });
// console.log(process.env.CLIENT_ID);

// TODO : 로그인 링크로 보내기
// https://github.com/login/oauth/authorize?client_id=62df6a26dc0a1fe0cc55]
// TODO : redirect -> uri 가져오기 (code 얻기)
// TODO : code, client id, client secret 포함해서 post 하기
// TODO : 가져온 정보 저장하기

// const testAxios = async () => {
//   await axios.get(
// //     "https://github.com/login/oauth/authorize?client_id=62df6a26dc0a1fe0cc55",
// //     { headers: { Origin: "http://127.0.0.1:3000/" } }
//   );
// };

// github.com/login/oauth/access_token?client_id=8e6e592f2100bc8d3d6e&client_secret=5592fab51319422d327a7d06a792d1e41dab453d&code=2392c1b993914d729738

// const getAccessToken = async (code) => {
//   const client_id = "62df6a26dc0a1fe0cc55";
//   const client_secret = "c1ab1b4d9d6ef0536f31d8156c68174eecff673f";
//   const token = await axios.post(
//     `https://github.com/login/oauth/access_token?client_id=${client_id}&client_secret=${client_secret}&code=${code}`
//   );
//   localStorage.setItem("token", token);
//   console.log(token);
// };

// const loginGithub = async () => {
//   window.location.href =
//     "https://github.com/login/oauth/authorize?client_id=62df6a26dc0a1fe0cc55";
// const authCode = /.code=(.*)/.exec(window.location)[1];
//   localStorage.setItem("code", authCode);
// };

// const App = () => {
//   let [url, setUrl] = useState(null);

//   useEffect(() => {
//     console.log(url);
//   }, [url]);

//   const test = () => {
//     setUrl(
//       (url =
//         "https://github.com/login/oauth/authorize?client_id=62df6a26dc0a1fe0cc55")
//     );
//   };

//   return <button onClick={test}></button>;
// };

const App = () => {
  return (
    <div>
      {/* <button onClick={useLocation}>SWON TEST</button> */}
      <Link to="/login">
        <button>LOGIN</button>
      </Link>
    </div>
  );
};

export default App;
