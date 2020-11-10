import React, { useContext } from 'react';
import styled from 'styled-components';
import { IssueContext } from '@Stores/IssueStore';
import IssueListHeader from './IssueListHeader';
import IssueListItem from './IssueListItem';

const IssueListBoard = () => {
  const { issueState } = useContext(IssueContext);
  return (
    <Board>
      <IssueListHeader />
      {issueState.map((issue) => {
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
