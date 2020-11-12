import React from 'react';
import styled from 'styled-components';
import AddAssigneeSideBar from './AddAssigneeSideBar';
import AddLabelSideBar from './AddLabelSideBar';
import AddMilestoneSideBar from './AddMilestoneSideBar';

const SideBar = () => {
  return (
    <Div>
      <AddAssigneeSideBar />
      <AddLabelSideBar />
      <AddMilestoneSideBar />
    </Div>
  )
};

const Div = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
`;

export default SideBar;
