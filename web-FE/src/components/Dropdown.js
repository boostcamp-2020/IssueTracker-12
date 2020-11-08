import React from 'react';
import styled from 'styled-components';
import DropdownModal from './DropdownModal';

const Dropdown = () => {
  return (
    <details>
      <summary>
        Filters
        <DropdownImage/>
      </summary>
      <DropdownModal/>
      
    </details>
  )
};

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
`;

export default Dropdown;
