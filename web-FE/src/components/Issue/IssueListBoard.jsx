import React, { useContext } from 'react';
import styled from 'styled-components';
import { IssueContext } from '@Stores/IssueStore';
import IssueListHeader from './IssueListHeader';
import IssueListItem from './IssueListItem';
import { IssueContext } from '@Stores/IssueStore';
import { IssueFilterContext } from '@Stores/IssueFilterStore';
import filter from '@Service/issue/filter';

const IssueListBoard = () => {
  const {issueState} = useContext(IssueContext);
  const {filterState} = useContext(IssueFilterContext);
  const filteredIssues = filter(issueState, filterState);
  console.log(filteredIssues);
  return (
    <Board>
      <IssueListHeader />
      {filteredIssues.map((issue) => {
        const { issue_id: issueId } = issue;
        return (<IssueListItem issue={issue} key={issueId} />);
      })}
    </Board>
  );
};

const Board = styled.div`
  display:flex;
  flex-direction: column;
  margin: 30px 40px 0 40px;
  align-items: stretch;
  width: 100%;
`;

export default IssueListBoard;
