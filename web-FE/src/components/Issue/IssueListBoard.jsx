import React, { useContext, useState } from 'react';
import styled from 'styled-components';
import { IssueContext } from '@Stores/IssueStore';
import IssueListHeader from './IssueListHeader';
import IssueListItem from './IssueListItem';
import { IssueFilterContext } from '@Stores/IssueFilterStore';
import filter from '@Services/issue/filter';

const IssueListBoard = () => {
  const {issueState, dispatch} = useContext(IssueContext);
  const {filterState} = useContext(IssueFilterContext);
  const [selected, setSelected] = useState({});
  const filteredIssues = filter(issueState, filterState);
  console.log(selected);
  return (
    <Board>
      <IssueListHeader selected={selected} action={dispatch}/>
      {filteredIssues.map((issue) => {
        const { issue_id: issueId } = issue;
        return (
          <IssueListItem
            issue={issue}
            key={issueId}
            selected={selected}
            setSelected={setSelected} 
          />
        );
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
