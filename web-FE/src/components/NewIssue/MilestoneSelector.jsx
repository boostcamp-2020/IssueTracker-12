import React, { useState, useContext } from 'react';
import styled from 'styled-components';
import AddSelector from './AddSelector';

const MilestoneSelector = ({selected, setSelected, milestoneState}) => {
  const title = 'Milestones';
  const className = 'milestone-selector';
  const list = milestoneState.map((milestone) => {
    const { milestone_id: id, ...rest } = milestone;
    return { id, ...rest };
  });
  const onclickSelect = (id) => {
    if (selected[0] === id) {
      setSelected([]);
      return;
    }
    setSelected([id]);
  };
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

export default MilestoneSelector;
