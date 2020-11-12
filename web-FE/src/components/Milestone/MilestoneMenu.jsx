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
  width: 100%;
  margin-top: 30px;
`;

const NewMilestoneButton = styled(Button)`
  line-height: 25px;
  margin-left: 20px;
`;

export default MilestoneMenu;
