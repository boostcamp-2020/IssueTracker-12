import React from 'react';
import styled from 'styled-components';
import Dropdown from '../commons/Dropdown';

const IssueListBoard = () => (
  <FlexRowDiv>
    <Checkbox>
      <input type="checkbox" name="check-all" />
    </Checkbox>
    <FilterContainer>
      <IssueFilter className="issue-filter" />
      <IssueFilter className="issue-filter" />
      <IssueFilter className="issue-filter" />
      <IssueFilter className="issue-filter" />
    </FilterContainer>
  </FlexRowDiv>
);

const FlexRowDiv = styled.div`
  display:flex;
  flex-direction: row;
  align-items: center;
  height: 50px;
  background-color: #ececec;
  border-radius: 10px 10px 0 0;
  border: 1px solid #e1e4e8;
`;

const FilterContainer = styled.div`
  display:flex;
  flex:1;
  justify-content: flex-end;
`;

const Checkbox = styled.label`
  display: block;
  padding: 8px 0 8px 16px;
`;

const IssueFilter = styled(Dropdown)`
  margin-right: 30px;
`;

export default IssueListBoard;
