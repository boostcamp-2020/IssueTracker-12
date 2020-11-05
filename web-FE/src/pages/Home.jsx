import React, { useEffect } from "react";
import { linkToGetCode, getUserInfo, saveUser } from '../api/auth';

const App = () => {
  useEffect( async () => {
    const reg = /.code=(.*)/
    if(reg.test(window.location)){
      const code = reg.exec(window.location)[1]
      const {userInfo, isExistUser} = await getUserInfo(code)
      if(isExistUser){
        alert('login되었습니다')
      }
      else{
        await saveUser(userInfo)
        alert('회원가입되었습니다')
      }
    }
    
  });

  return <button onClick={linkToGetCode}>GITHUB</button>;
};


export default App;