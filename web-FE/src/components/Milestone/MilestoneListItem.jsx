import React from 'react';
import styled from 'styled-components';

const MilestoneListItem = (props) => {
  const { milestone } = props;

  const {
    milestone_id: milestoneId,
    title,
    content,
    due_date: dueDate,
  } = milestone;

  return (
    <FlexRowDiv>
      <MilestoneContent>
        <h3>{title}</h3>
        <p>Due by {changeDateStyle(dueDate)}</p>
        <p>{content}</p>
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
`;

const MilestoneContent = styled.div`
  display: flex;
  flex-direction: column;
`;

const changeDateStyle = (dueDate) => {
  const dueDateList = dueDate.split('-');
  const date = dueDateList[0];
  const month = dueDateList[1];
  const year = dueDateList[2];
  return `${month} ${date}, ${year}`;
};

export default MilestoneListItem;
