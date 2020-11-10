import React, { useContext } from 'react';
import styled from 'styled-components';
import IssueMenu from './IssueMenu';
import IssueListBoard from './IssueListBoard';
import { IssueContext } from '@Stores/IssueStore';

const IssueMain = () => {
  const {issueState, dispatch} = useContext(IssueContext);
  console.log(issueState);
  return (
    <IssueMainContainer>
      <IssueMenu/>
      <IssueListBoard/>
    </IssueMainContainer>
  )
};

const FlexColumn = `
  display: flex;
  flex-direction: column;
`;

const FlexColumnDiv = styled.div`
  ${FlexColumn}
`;

const IssueMainContainer = styled(FlexColumnDiv)`
  ${FlexColumn}
  align-items: center;
  margin-top: 30px;
  padding: 0 30px;
`;

export default IssueMain;
