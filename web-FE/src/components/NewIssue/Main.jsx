import React from 'react';
import styled from 'styled-components';
import InputDiv from './InputDiv';
import SideBar from './SideBar';

const NewIssueMain = () => (
  <MainContainer>
    <ImgDiv>
      <Img />
    </ImgDiv>
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

const ImgDiv = styled.div`
  align-self: flex-start;
  width: 60px;
  border: 1px solid #181818;
`;

const Img = styled.img`
  width: 45px;
  height: 45px;
  border: 1px solid #181818;
`;

const Info = styled.div`
  margin:auto;
  width: 30%;
  height: 400px;
`;

export default NewIssueMain;
