import React from "react";
import styled from "styled-components";
import LabelMilestoneTag from "@Components/commons/LabelMilestoneTag";
import Button from "@Components/commons/Button";

const LabelMenu = () => (
  <FlexRowDiv>
    <LabelMilestoneTag />
    <NewLabelButton>New Issue?????</NewLabelButton>
  </FlexRowDiv>
);

const FlexRowDiv = styled.div`
  display: flex;
  flex-direction: row;
  width: 100%;
`;

const common = `
  height: 35px;
  box-sizing: border-box;
  border: 1px solid lightgrey;
`;

const NewLabelButton = styled(Button)`
  line-height: 25px;
  margin-left: 20px;
`;

export default LabelMenu;
