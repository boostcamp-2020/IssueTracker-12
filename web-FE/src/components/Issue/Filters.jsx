import React, {useContext} from 'react';
import styled from 'styled-components';

import { UserContext } from '@Stores/UserStore';
import { LabelContext } from '@Stores/LabelStore';
import { IssueFilterContext } from '@Stores/IssueFilterStore';
import { MilestoneContext } from '@Stores/MilestoneStore';

import Dropdown from '../commons/Dropdown';

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
  const {filterState, setFilterState} = useContext(IssueFilterContext);

  const setFilter = (id) => {
    setFilterState({...filterState, menuFilter: [id]});
  };

  const filterList = [
    { title: 'none', id: 0},
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
      setSelect={setFilter}
      selectionList={filterState.menuFilter}
    />
  );
};

export const IssueAuthorFilter = () => {
  const { userState } = useContext(UserContext);
  const list = userState.map((user) => {
    const { username: title, user_id: id, ...rest } = user;
    return { title, id, ...rest };
  });
  const {filterState, setFilterState} = useContext(IssueFilterContext);
  const setFilter = (id) => {
    setFilterState({...filterState, authorFilter: [id]});
  };

  return (
    <IssueFilterInHeader
      title="Author"
      className="issue-filter"
      list={list}
      setSelect={setFilter}
      selectionList={filterState.authorFilter}
    />
  );
};

export const IssueLabelFilter = () => {
  const { labelState } = useContext(LabelContext);
  const list = labelState.map((label) => {
    const { label_name: title, label_id: id, ...rest } = label;
    return { title, id, ...rest };
  });
  const {filterState, setFilterState} = useContext(IssueFilterContext);
  const setFilter = (id) => {
    const { labelFilter } = filterState;
    
    if (labelFilter.includes(id)) {
      const labelWithoutId = labelFilter.filter((label) => label !== id);
      return setFilterState({...filterState, labelFilter: labelWithoutId});
    }
    return setFilterState({...filterState, labelFilter: [...labelFilter, id]});
  };

  return (
    <IssueFilterInHeader
      title="Label"
      className="issue-filter"
      list={list}
      setSelect={setFilter}
      selectionList={filterState.labelFilter}
    />
  );
};

export const IssueMilestoneFilter = () => {
  const { milestoneState } = useContext(MilestoneContext);
  const list = milestoneState.map((label) => {
    const { milestone_id: id, ...rest } = label;
    return { id, ...rest };
  });
  const {filterState, setFilterState} = useContext(IssueFilterContext);
  const setFilter = (id) => {
    setFilterState({...filterState, milestoneFilter: [id]});
  };

  return (
    <IssueFilterInHeader
      title="Milestone"
      className="issue-filter"
      list={list}
      setSelect={setFilter}
      selectionList={filterState.milestoneFilter}
    />
  );
};

export const IssueAssigneeFilter = () => {
  const { userState } = useContext(UserContext);
  const list = userState.map((user) => {
    const { username: title, user_id: id, ...rest } = user;
    return { title, id, ...rest };
  });
  const {filterState, setFilterState} = useContext(IssueFilterContext);
  const setFilter = (id) => {
    setFilterState({...filterState, assigneeFilter: [id]});
  };

  return (
    <IssueFilterInHeader
      title="Assignee"
      className="issue-filter"
      list={list}
      setSelect={setFilter}
      selectionList={filterState.assigneeFilter}
    />
  );
};