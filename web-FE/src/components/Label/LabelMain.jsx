import React from 'react';
import styled from 'styled-components';
import { DisplayProvider } from '@Stores/NewLabelContext';

import LabelMenu from './LabelMenu';
import LabelListBoard from './LabelListBoard';
import NewLabelForm from './NewLabelForm';

const LabelMain = () => (
  <DisplayProvider>
    <MainContainer>
      <LabelMenu />
      <NewLabelForm />
      <LabelListBoard />
    </MainContainer>
  </DisplayProvider>
);

const MainContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0 30px;
`;

export default LabelMain;
