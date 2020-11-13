import React, { useState } from 'react';
import styled from 'styled-components';
import { ReactComponent as CheckImage } from '@Images/check.svg';

const DropdownModal = ({list, setSelect, selectionList}) => (
  <>
    <DetailsModal>
      {
        list?.map(v => (
          <Select
            key={v.id}
            checked={!!selectionList?.includes(v.id)}
            onClick={() => setSelect(v.id)}
            className="select"
          >
            {v.title}
          </Select>
        ))
      }
    </DetailsModal>
  </>
);


const Select = ({checked, children, onClick}) => (
  <Li onClick={onClick}>
    {
      checked ? (
        <CheckIcon
          width="16px"
          height="16px"

        />
      ) : null
    }
    {children}

  </Li>
);

const CheckIcon = styled(CheckImage)`
  top: 0;
  left: 0;
`;

const DetailsModal = styled.ul`
  display: flex;
  width: 200px;
  max-height: 600px;
  position: absolute;
  flex-direction: column;
  z-index: 10;
  list-style-type : none;
  padding: 0;
  background-color: white;
  box-shadow: #e6e6e6 0px 0px 4px 0px;
  border-radius: 3px;
}
`;

const Li = styled.li`
  display:flex;
  position:relative;
  align-items: center;
  width: 100%;
  height: 40px;
  box-sizing: border-box;
  padding: 10px 20px;
  border-bottom: 1px solid #f0f0f0;
  font-size: 12px;
  color: #333333;
  cursor:pointer;
`;

export default DropdownModal;
