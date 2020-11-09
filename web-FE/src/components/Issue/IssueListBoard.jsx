import React from 'react';
import styled from 'styled-components';
import IssueListHeader from './IssueListHeader';
import IssueListItem from './IssueListItem';

const IssueListBoard = () => (
  <Board>
    <IssueListHeader />
    <IssueListItem />
    <IssueListItem />
    <IssueListItem />
    <IssueListItem />
    <IssueListItem />
  </Board>
);

const Board = styled.div`
  display:flex;
  flex-direction: column;
  margin: 30px 40px 0 40px;
  align-items: stretch;
  width: 100%;
`;

export default IssueListBoard;
