import React, { useEffect, Fragment } from "react";
import { linkToGetCode, getUserInfo, saveUser } from '../../api/auth';
import styled from 'styled-components'

const GithubLogin = () => {
    const reg = /.code=(.*)/
    if(reg.test(window.location)){
      const code = reg.exec(window.location)[1]
      const {userInfo, isExistUser} = await getUserInfo(code)
      if(isExistUser){
        alert('login되었습니다')
        location.href = '/issue'
        return
      }
      await saveUser(userInfo)
      alert('회원가입되었습니다')
    }
  });

  return ( 
  <React.Fragment>
    <Button onClick={linkToGetCode}>Sign in with GitHub</Button>
  </React.Fragment>
  )
};


export default GithubLogin;