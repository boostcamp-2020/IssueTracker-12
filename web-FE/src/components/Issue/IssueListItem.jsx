import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';
import OpenCloseIndicator from './OpenCloseIndicator';
import LabelBadge from '@Components/commons/LabelBadge';

const IssueListItem = (props) => {
  const { issue } = props;

  const {
    issue_id: issueId,
    title,
    write_time: writeTime,
    is_open: isOpen,
    writer,
    labels,
  } = issue;
  const issueInfo = `#${issueId} opened at ${writeTime} by ${writer}`;
  return (
    <ItemContainer>
      <Checkbox>
        <input type="checkbox" name="check-all" />
      </Checkbox>
      <OpenCloseIndicator isOpen={isOpen} />
      <IssueContent>
        <FlexRowDiv>
          <IssueTitle to="/">{title}</IssueTitle>
          <>
            {labels.map((label) => (
              <LabelBadge
                key={label.label_id}
                color={label.color}
                name={label.label_name}
                margin="0 0 0 10px"
              />
            ))}
          </>
        </FlexRowDiv>
        <IssueInfo>
          {issueInfo}
        </IssueInfo>
      </IssueContent>
    </ItemContainer>
  );
};

const FlexRowDiv = styled.div`
  display:flex;
  flex-direction: row;
  align-items: center;
  
`;

const ItemContainer = styled(FlexRowDiv)`
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
