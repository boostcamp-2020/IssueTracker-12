import React, { useContext } from 'react';
import styled from 'styled-components';
import ActionDropdown from '@Components/Issue/ActionDropdown';
import { IssueAssigneeFilter, IssueAuthorFilter, IssueLabelFilter, IssueMilestoneFilter } from './Filters';

const IssueListBoard = ({ selected, action }) => {
  const selectedNum = Object.keys(selected).length;
  return (
    <FlexRowDiv>
      <Checkbox>
        <input type="checkbox" name="check-all" />
      </Checkbox>
      {
        selectedNum ?
          (
            <>
              <SelectedIndicator>
                {selectedNum}
                {' '}
                selected
              </SelectedIndicator>
              <FilterContainer>
                <ActionDropdown
                  className="action-dropdown"
                  action={action}
                  selected={selected}
                />
              </FilterContainer>
            </>
          )
          : (
            <FilterContainer>
              <IssueAuthorFilter />
              <IssueLabelFilter />
              <IssueMilestoneFilter />
              <IssueAssigneeFilter />
            </FilterContainer>
          )
      }
    </FlexRowDiv>
  );
}

const SelectedIndicator = styled.span`
    color: grey;
    margin-left: 20px;
`;

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

export default IssueListBoard;
