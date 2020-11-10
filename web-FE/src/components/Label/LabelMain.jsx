import React from 'react';
import styled from 'styled-components';
import LabelMenu from './LabelMenu';
import LabelListBoard from './LabelListBoard';

const LabelMain = () => (
  <MainContainer>
    <LabelMenu />
    <LabelListBoard />
  </MainContainer>
);

const FlexColumn = `
  display: flex;
  flex-direction: column;
`;

const FlexColumnDiv = styled.div`
  ${FlexColumn}
`;

const MainContainer = styled(FlexColumnDiv)`
  ${FlexColumn}
  align-items: center;
  margin-top: 30px;
  padding: 0 30px;
`;

export default LabelMain;
