import React, { useEffect, Fragment } from "react";
import { getUserInfo, saveUser, linkToGetCode, signIn } from "@Api/auth";
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
    const token = localStorage.getItem("token");
    if (reg.test(window.location)) {
      const code = reg.exec(window.location)[1];
      const { userInfo, isExistUser } = await getUserInfo(code);
      const { user_id: userid, username, social, url } = userInfo;
      if (!isExistUser) {
        const userid = await saveUser(username, social);
      }
      await signIn(username, social);
      alert("로그인 되었습니다 🙌🏻");
      location.href = "/issue";
      return;
    }
  });

  return (
    <Fragment>
      <Button onClick={linkToGetCode}>Sign in with GitHub</Button>
    </Fragment>
  );
};

export default GithubLogin;
