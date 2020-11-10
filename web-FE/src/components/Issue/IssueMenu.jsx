import React from 'react';
import styled from 'styled-components';
import Dropdown from '@Components/commons/Dropdown';
import Searchbar from '@Components/commons/Searchbar';
import ButtonWithIcon from '@Components/commons/ButtonWithIcon';
import Button from '@Components/commons/Button';
import labelIcon from '@Images/label.svg';
import milestoneIcon from '@Images/milestone.svg';
import { IssueMenuFilter } from './Filters';

const IssueMenu = () => {
  return (
    <FlexRowDiv>
      <IssueMenuFilter />
      <IssueFilterSearchbar 
        className="issue-filter-searchbar"
        />
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
      <NewIssueButton>New Issue</NewIssueButton>
    </FlexRowDiv>
  );
}


const FlexRowDiv = styled.div`
  display:flex;
  flex-direction: row;
  width: 100%;
`;

const common = `
  height: 35px;
  box-sizing: border-box;
  border: 1px solid lightgrey;
`;

const IssueFilterSearchbar = styled(Searchbar)`
  ${common}
  border-radius: 0 5px 5px 0;
  line-height: 20px;
  margin-right: 20px;
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

const NewIssueButton = styled(Button)`
  line-height: 25px;
  margin-left: 20px;
`;

export default IssueMenu;
