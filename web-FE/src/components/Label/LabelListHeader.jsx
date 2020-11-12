import React, { useContext } from 'react';
import styled from 'styled-components';
import { LabelContext } from '@Stores/LabelStore';

const LabelListHeader = () => {
  const { labelState } = useContext(LabelContext);
  return (
    <FlexRowDiv>
      <P>
        {labelState.length}
        Labels
      </P>
    </FlexRowDiv>
  );
};

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
