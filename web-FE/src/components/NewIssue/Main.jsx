import React from 'react';
import styled from 'styled-components';
import InputDiv from './InputDiv';
import SideBar from './SideBar';

const NewIssueMain = () => (
  <MainContainer>
    <Img src='https://i.imgur.com/oPR4BiX.jpeg'/>
    <InputDiv />
    <Info>
      <SideBar />
    </Info>
  </MainContainer>
);

const MainContainer = styled.div`
  display: flex;
  margin-top: 20px;
  align-items: center;
  padding: 0 30px;
`;

const Img = styled.img`
  align-self: flex-start;
  width: 45px;
  height: 45px;
  border-radius: 50%;
`;

const Info = styled.div`
  margin:auto;
  width: 30%;
  height: 400px;
`;

export default NewIssueMain;
