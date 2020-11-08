import React from 'react';
import styled from 'styled-components';
import IssueMenu from './IssueMenu';

const IssueMain = () => {
  return (
    <IssueMainContainer>
      <IssueMenu/>
      {/* <IssueListForm/> */}
    </IssueMainContainer>
  )
};

const FlexRow = `
  display: flex;
  flex-direction: row;
`;

const FlexRowDiv = styled.div`
  ${FlexRow}
`;

const IssueMainContainer = styled(FlexRowDiv)`
  ${FlexRow}
  align-items: center;
  margin-top: 30px;
`;

export default IssueMain;
