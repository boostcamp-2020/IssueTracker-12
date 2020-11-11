import React from 'react';
import styled from 'styled-components';
import { DisplayProvider } from '@Stores/newLabelContext';
import { EditDisplayProvider } from '@Stores/EditLabelContext';
import LabelMenu from './LabelMenu';
import LabelListBoard from './LabelListBoard';
import NewLabelForm from './NewLabelForm';

const LabelMain = () => (
  <DisplayProvider>
    <EditDisplayProvider>
      <MainContainer>
        <LabelMenu />
        <NewLabelForm />
        <LabelListBoard />
      </MainContainer>
    </EditDisplayProvider>
  </DisplayProvider>
);

const MainContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0 30px;
`;

export default LabelMain;
