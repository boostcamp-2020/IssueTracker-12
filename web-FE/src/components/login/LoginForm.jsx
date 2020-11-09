import React from "react";
import styled from 'styled-components'

const LoginForm = () => {

    const Input = styled.input`
        position: relative;
        padding: 0.5em;
        margin: 0.5em;
        width: 200px;
        color: ${props => props.inputColor || "palevioletred"};
        background: papayawhip;
        border: none;
        border-radius: 3px;
    `;
  return ( 
  <div>
    <p>아이디</p>
    <Input placeholder="아이디를 입력해도 소용업습니다" type="text" />
    <p>비밀번호</p>
    <Input placeholder="깃헙로그인을 이용하새오" type="password" inputColor="rebeccapurple" />
  </div>
  )
};


export default LoginForm;