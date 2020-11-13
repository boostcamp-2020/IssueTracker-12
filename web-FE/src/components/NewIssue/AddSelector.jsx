import React from 'react';
import styled from 'styled-components';
import Dropdown from '../commons/Dropdown';

const AddSelector = ({ className, title, list, setSelect, selectionList }) => (
  <Dropdown
    className={className}
    title={title}
    list={list}
    setSelect={setSelect}
    selectionList={selectionList}
  />
)

export default AddSelector;
