import React from 'react';
import styled from 'styled-components';

const MilestoneListHeader = () => (
  <FlexRowDiv>
    <P>2 Open</P>
    <P>0 Closed</P>
  </FlexRowDiv>
);

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
