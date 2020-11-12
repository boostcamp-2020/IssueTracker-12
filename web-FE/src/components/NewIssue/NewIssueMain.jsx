import React from 'react';
import styled from 'styled-components';
import SideBar from './SideBar';

const NewIssueMain = () => (
  <MainContainer>
    <SideBar />

  </MainContainer>

);

const MainContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0 30px;
`;

export default NewIssueMain;