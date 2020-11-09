import React, { useEffect, Fragment } from "react";
import { linkToGetCode, getUserInfo, saveUser } from "../../api/auth";
import styled from "styled-components";

const GithubLogin = () => {
  const Button = styled.button`
    font-size: 1em;
    color: #ffffff;
    margin: 1em;
    padding: 0.25em 1em;
    border: 2px solid palevioletred;
    border-radius: 3px;
    background: papayawhip;
    &:hover {
      background: palevioletred;
    }
  `;

  useEffect(async () => {
    const reg = /.code=(.*)/;
    if (reg.test(window.location)) {
      const code = reg.exec(window.location)[1];
      const { userInfo, isExistUser } = await getUserInfo(code);
      if (isExistUser) {
        alert("login되었습니다");
        location.href = "/issue";
        return;
      }
      await saveUser(userInfo);
      alert("회원가입되었습니다");
    }
  });

  return (
    <React.Fragment>
      <Button onClick={linkToGetCode}>Sign in with GitHub</Button>
    </React.Fragment>
  );
};

export default GithubLogin;
