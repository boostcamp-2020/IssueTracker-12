import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';
import OpenCloseIndicator from './OpenCloseIndicator';

const IssueListItem = () => (
  <FlexRowDiv>
    <Checkbox>
      <input type="checkbox" name="check-all"/>
    </Checkbox>
    <OpenCloseIndicator />
    <IssueContent>
      <IssueTitle to="/">Issue title</IssueTitle>
      <IssueInfo>#93 opened 1 hour ago by aaa</IssueInfo>
    </IssueContent>
  </FlexRowDiv>
);

const FlexRowDiv = styled.div`
  display:flex;
  flex-direction: row;
  align-items: center;
  height: 50px;
  border-right: 1px solid #e1e4e8;
  border-left: 1px solid #e1e4e8;
  border-bottom: 1px solid #e1e4e8;
  background-color: white;
`;

const Checkbox = styled.label`
  padding: 8px 0 8px 16px;
`;

const IssueContent = styled.div`
  padding: 8px;
  flex: 1;
`;

const IssueTitle = styled(Link)`
  font-weight: 600;
  font-size: 16px;
  text-decoration:none;
  color: black;
`;

const IssueInfo = styled.div`
  font-size: 10px;
  color: lightgrey;
`;

export default IssueListItem;
