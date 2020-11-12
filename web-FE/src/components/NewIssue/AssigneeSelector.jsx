import React, { useState, useContext } from 'react';
import styled from 'styled-components';
import AddSelector from './AddSelector';

const AssigneeSelector = ({selected, setSelected, userState}) => {
  const title = 'Assignees';
  const className = 'assignee-selector';
  const list = userState.map((user) => {
    const { username: title, user_id: id, ...rest } = user;
    return { title, id, ...rest };
  });
  const onclickSelect = (id) => {
    if (selected.includes(id)) {
      const rest = selected.filter((item) => item !== id);
      setSelected(rest);
      return;
    }
    setSelected([...selected, id]);
  }
  return (
    <AddSelector
      className={className}
      title={title}
      list={list}
      setSelect={onclickSelect}
      selectionList={selected}
    />
  )
}

export default AssigneeSelector;
