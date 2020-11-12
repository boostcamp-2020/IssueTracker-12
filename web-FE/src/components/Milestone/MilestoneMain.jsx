import React from 'react';
import styled from 'styled-components';
import MilestoneMenu from './MilestoneMenu';
import MilestoneListBoard from './MilestoneListBoard';

const MilestoneMain = () => (
  <MainContainer>
    <MilestoneMenu />
    <MilestoneListBoard />
  </MainContainer>
);

const MainContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-item: center;
`;

export default MilestoneMain;
