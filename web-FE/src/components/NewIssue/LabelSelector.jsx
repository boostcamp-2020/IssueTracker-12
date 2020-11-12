import React, { useState, useContext } from 'react';
import styled from 'styled-components';
import AddSelector from './AddSelector';

const LabelSelector = ({selected, setSelected, labelState}) => {
  const title = 'Labels';
  const className = 'label-selector';
  const list = labelState.map((label) => {
    const { label_name: title, label_id: id, ...rest } = label;
    return { title, id, ...rest };
  });
  const onclickSelect = (id) => {
    if (selected.includes(id)) {
      const rest = selected.filter((item) => item !== id);
      setSelected(rest);
      return;
    }
    setSelected([...selected, id]);
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

export default LabelSelector;
