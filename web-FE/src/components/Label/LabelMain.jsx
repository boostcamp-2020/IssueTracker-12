import React from 'react';
import styled from 'styled-components';
import LabelMenu from './LabelMenu';
import LabelListBoard from './LabelListBoard';
import NewLabelForm from './NewLabelForm';

const LabelMain = () => (
  <MainContainer>
    <LabelMenu />
    <NewLabelForm />
    <LabelListBoard />
  </MainContainer>
);

const MainContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0 30px;
`;

export default LabelMain;
