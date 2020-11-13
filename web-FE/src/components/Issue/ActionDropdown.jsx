import React, { useContext } from 'react';
import styled from 'styled-components';
import Dropdown from '../commons/Dropdown';

const ActionDropdown = ({className, action, selected}) => {
  const title = 'Mark as';
  const list = [
    { title: 'Open', id: 1 },
    { title: 'Close', id: 2 },
  ];
  const setSelect = (id) => {
    const selectedList = Object.values(selected);
    if (id === 1) {
      action({ type: 'OPEN', data: selectedList });
    } else if (id === 2) {
      console.log(selected);
      action({ type: 'CLOSE', data: selectedList });
    }
  }
  return (
    <Dropdown
      className={className}
      title={title}
      list={list}
      action={action}
      setSelect={setSelect}
    />
  )
}

const StyledActionDropdown = styled(ActionDropdown)`
  margin-right: 10px;
`;

export default StyledActionDropdown;
