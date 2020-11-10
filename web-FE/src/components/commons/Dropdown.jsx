import React from 'react';
import styled from 'styled-components';
import DropdownModal from './DropdownModal';

const Dropdown = ({ className, title, list }) => {

  return (
    <details
      className={className}
    >
      <DropdownButton>
        {title}
        <DropdownImage />
      </DropdownButton>
      <DropdownModal list={list} />
    </details>
  );
} 

const DropdownButton = styled.summary`
  position: relative;
  cursor: pointer;

  &::-webkit-details-marker {
    display: none;
  }
`;

const DropdownImage = styled.span`
  display: inline-block;
  width: 0;
  height: 0;
  vertical-align: middle;
  content: "";
  border-top-style: solid;
  border-top-width: 4px;
  border-right: 4px solid transparent;
  border-bottom: 0 solid transparent;
  border-left: 4px solid transparent;
  margin-left: 3px;
`;

export default Dropdown;
