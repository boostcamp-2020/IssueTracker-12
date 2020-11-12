import React from 'react';
import styled from 'styled-components';
import LabelMilestoneTag from '@Common/LabelMilestoneTag';
import Button from '@Common/Button';

const MilestoneMenu = () => (
  <FlexRowDiv>
    <LabelMilestoneTag />
    <NewMilestoneButton>New milestone</NewMilestoneButton>
  </FlexRowDiv>
);

const FlexRowDiv = styled.div`
  display: flex;
  justify-content: space-between;
  flex-direction: row;
  width: 95%;
  margin-top: 30px;
  margin-left: 30px;
`;

const NewMilestoneButton = styled(Button)`
  line-height: 25px;
`;

export default MilestoneMenu;
