import React from 'react';
import styled from 'styled-components';
import LoginForm from './LoginForm';
import GithubLoginButton from './GithubLoginButton';

const App = () => {
  const Div = styled.div`
    border: 1px solid grey;
    border-radius: 10px;
    width: 350px;
    height: 400px;
    padding: 20px;
  `;

  const Title = styled.h1`
    font-size: 1.5em;
    text-align: center;
    color: palevioletred;
  `;

  return (
    <Div>
      <Title>ISSUE TRACKER</Title>
      <LoginForm />
      <GithubLoginButton />
    </Div>
  );
};

export default App;
