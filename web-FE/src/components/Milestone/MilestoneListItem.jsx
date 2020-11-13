import React from 'react';
import styled from 'styled-components';
import { changeDateStyle } from '../../utils/changeDateStyle';
import MilestoneEditMenu from './MilestoneEditMenu';

const MilestoneListItem = (props) => {
  const { milestone } = props;
  const {
    milestone_id: milestoneId,
    title,
    content,
    due_date: dueDate,
    issueInfo,
  } = milestone;

  const { openedIssue, closedIssue, completed } = issueInfo;
  return (
    <FlexRowDiv>
      <MilestoneContent>
        <MilestoneContentLeft>
          <MilestoneTitle>{title}</MilestoneTitle>
          <MilestoneDueDate>Due by {changeDateStyle(dueDate)}</MilestoneDueDate>
          <MilestoneContentDescription>{content}</MilestoneContentDescription>
        </MilestoneContentLeft>
        <MilestoneContentRight>
          <ProgressBar>
            <InProgress completed={completed} />
          </ProgressBar>
          <RightInternal>
            <PBold>{completed}</PBold>
            <P>complete</P>
            <PBold>{openedIssue}</PBold>
            <P>open</P>
            <PBold>{closedIssue}</PBold>
            <P>closed</P>
          </RightInternal>
          <MilestoneEditMenu />
        </MilestoneContentRight>
      </MilestoneContent>
    </FlexRowDiv>
  );
};

const FlexRowDiv = styled.div`
  display: flex;
  border-right: 1px solid #e1e4e8;
  border-left: 1px solid #e1e4e8;
  border-bottom: 1px solid #e1e4e8;
  background-color: white;
  width: 95%;
`;

const MilestoneContent = styled.div`
  display: flex;
  flex-direction: row;
  padding: 10px 15px;
  width: 100%;
`;

const MilestoneContentLeft = styled.div`
  display: flex;
  flex-direction: column;
  width: 50%;
`;

const MilestoneTitle = styled.h2`
  margin: 5px;
`;

const MilestoneDueDate = styled.p`
  margin: 5px;
`;

const MilestoneContentDescription = styled.p`
  margin: 5px;
`;

const MilestoneContentRight = styled.div`
  display: flex;
  flex-direction: column;
  width: 40%;
`;

const RightInternal = styled.div`
  display: flex;
  flex-direction: row;
`;

const PBold = styled.p`
  margin-right: 5px;
  font-weight: bold;
`;

const P = styled.p`
  margin-right: 10px;
`;
const ProgressBar = styled.div`
  background-color: #e8eaed;
  width: 100%;
  height: 7px;
  border-radius: 3px;
`;
const InProgress = styled.div`
  background-color: #1fa15d;
  width: ${(props) => props.completed};
  border-radius: 3px;
  height: 7px;
  z-index: 10;
`;
export default MilestoneListItem;
