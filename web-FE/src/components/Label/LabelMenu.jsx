import React from 'react';
import styled from 'styled-components';
import LabelMilestoneTag from '@Common/LabelMilestoneTag';
import Button from '@Common/Button';
import { DisplayConsumer } from '@Stores/NewLabelContext';

const LabelMenu = () => (
  <DisplayConsumer>
    {({ actions }) => (
      <FlexRowDiv>
        <LabelMilestoneTag />
        <NewLabelButton onClick={() => { actions.setDisplay('flex'); }}>New Label</NewLabelButton>
      </FlexRowDiv>
    )}
  </DisplayConsumer>
);

const FlexRowDiv = styled.div`
  display: flex;
  justify-content:space-between;
  flex-direction: row;
  width: 100%;
  margin-top: 30px;
`;

const NewLabelButton = styled(Button)`
  line-height: 25px;
  margin-left: 20px;
`;

export default LabelMenu;
