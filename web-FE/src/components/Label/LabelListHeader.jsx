import React from 'react';
import styled from 'styled-components';

const LabelListHeader = () => (
  <FlexRowDiv>
    <P>8 Labels</P>
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

const P = styled.p`
  margin-left: 16px
`;

export default LabelListHeader;
