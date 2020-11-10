import React from "react";
import styled from "styled-components";
import Dropdown from "@Components/commons/Dropdown";
import Searchbar from "@Components/commons/Searchbar";
import LabelMilestoneTag from "@Components/commons/LabelMilestoneTag";
import Button from "@Components/commons/Button";

const IssueMenu = () => (
  <FlexRowDiv>
    <IssueFilter className="issue-filter" />
    <IssueFilterSearchbar className="issue-filter-searchbar" />
    <LabelMilestoneTag />
    <NewIssueButton>New Issue</NewIssueButton>
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

const IssueFilter = styled(Dropdown)`
  ${common}
  line-height: 25px;
  padding: 5px 12px 5px 20px;
  border-radius: 5px 0 0 5px;
  border-right: none;
`;

const IssueFilterSearchbar = styled(Searchbar)`
  ${common}
  border-radius: 0 5px 5px 0;
  line-height: 20px;
  margin-right: 20px;
`;

const NewIssueButton = styled(Button)`
  line-height: 25px;
  margin-left: 20px;
`;

export default IssueMenu;
