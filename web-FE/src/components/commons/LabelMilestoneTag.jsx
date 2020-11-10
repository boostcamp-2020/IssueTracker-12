import React from "react";
import styled from "styled-components";
import labelIcon from "@Images/label.svg";
import milestoneIcon from "@Images/milestone.svg";
import ButtonWithIcon from "./ButtonWithIcon";

const App = () => (
  <>
    <LabelButton
      className="label-button"
      image={labelIcon}
      name="label"
      number="3"
    />
    <MilestoneButton
      className="milestone-button"
      image={milestoneIcon}
      name="milestone"
      number="3"
    />
  </>
);

const common = `
  height: 35px;
  box-sizing: border-box;
  border: 1px solid lightgrey;
`;

const LabelButton = styled(ButtonWithIcon)`
  ${common}
  border-radius: 5px 0 0 5px;
  padding-left: 3px;
`;

const MilestoneButton = styled(ButtonWithIcon)`
  ${common}
  border-radius: 0 5px 5px 0;
  padding-right: 3px;
`;

export default App;
