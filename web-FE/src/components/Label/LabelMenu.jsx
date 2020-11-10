import React from 'react';
import styled from 'styled-components';
import LabelMilestoneTag from '@Common/LabelMilestoneTag';
import Button from '@Common/Button';

const LabelMenu = () => (
  <FlexRowDiv>
    <LabelMilestoneTag />
    <NewLabelButton>New Label</NewLabelButton>
  </FlexRowDiv>
);

const FlexRowDiv = styled.div`
  display: flex;
  justify-content:space-between;
  flex-direction: row;
  width: 100%;
`;

const NewLabelButton = styled(Button)`
  line-height: 25px;
  margin-left: 20px;
`;

export default LabelMenu;
