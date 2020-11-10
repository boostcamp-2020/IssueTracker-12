import React, {useContext} from 'react';
import styled from 'styled-components';

import { UserContext } from '@Stores/UserStore';
import { LabelContext } from '@Stores/LabelStore';
import {  } from '@Stores/MilestoneStore';

import Dropdown from '../commons/Dropdown';
import { MilestoneContext } from '../../stores/MilestoneStore';

const IssueFilterInMenu = styled(Dropdown)`
  height: 35px;
  box-sizing: border-box;
  border: 1px solid lightgrey;
  line-height: 25px;
  padding: 5px 12px 5px 20px;
  border-radius: 5px 0 0 5px;
  border-right:none;
`;

const IssueFilterInHeader = styled(Dropdown)`
  margin-right: 30px;
`;

export const IssueMenuFilter = () => {
  const filterList = [
    { title: 'Open issues', id: 1 },
    { title: 'Your issues', id: 2 },
    { title: 'Everything assigned to you', id: 3 },
    { title: 'Everything menthioning you', id: 4 },
    { title: 'Closed issues', id: 5 }
  ];
  return (
    <IssueFilterInMenu
      title="Filter"
      className="issue-filter"
      list={filterList}
    />
  );
};

export const IssueAuthorFilter = () => {
  const { userState } = useContext(UserContext);
  const list = userState.map((user) => {
    const { username: title, user_id: id, ...rest } = user;
    return { title, id, ...rest };
  });
  return (
    <IssueFilterInHeader
      title="Author"
      className="issue-filter"
      list={list}
    />
  );
};

export const IssueLabelFilter = () => {
  const { labelState } = useContext(LabelContext);
  const list = labelState.map((label) => {
    const { label_name: title, label_id: id, ...rest } = label;
    return { title, id, ...rest };
  });

  return (
    <IssueFilterInHeader
      title="Label"
      className="issue-filter"
      list={list}
    />
  );
};

export const IssueMilestoneFilter = () => {
  const { milestoneState } = useContext(MilestoneContext);
  const list = milestoneState.map((label) => {
    const { milestone_id: id, ...rest } = label;
    return { id, ...rest };
  });

  return (
    <IssueFilterInHeader
      title="Milestone"
      className="issue-filter"
      list={list}
    />
  );
};

export const IssueAssigneeFilter = () => {
  const { userState } = useContext(UserContext);
  const list = userState.map((user) => {
    const { username: title, user_id: id, ...rest } = user;
    return { title, id, ...rest };
  });

  return (
    <IssueFilterInHeader
      title="Assignee"
      className="issue-filter"
      list={list}
    />
  );
};