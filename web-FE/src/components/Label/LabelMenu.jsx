import React from 'react';
import styled from 'styled-components';
import LabelMilestoneTag from '@Common/LabelMilestoneTag';
import Button from '@Common/Button';
import { showCreateLabel } from '@Services/labelService';

const LabelMenu = () => (
  <FlexRowDiv>
    <LabelMilestoneTag />
    <NewLabelButton onClick={showCreateLabel}>New Label</NewLabelButton>
  </FlexRowDiv>
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
