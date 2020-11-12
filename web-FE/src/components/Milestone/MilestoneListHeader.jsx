import React from 'react';
import styled from 'styled-components';

const MilestoneListHeader = (props) => {
  const { open, close } = props;
  return (
    <FlexRowDiv>
      <P>{open} Open</P>
      <P>{close} Closed</P>
    </FlexRowDiv>
  );
};

const FlexRowDiv = styled.div`
  display: flex;
  flex-direction: row;
  align-items: center;
  width: 95%;
  height: 50px;
  background-color: #ececec;
  border-radius: 10px 10px 0 0;
  border: 1px solid #e1e4e8;
`;

const P = styled.span`
  margin: 16px;
`;

export default MilestoneListHeader;
