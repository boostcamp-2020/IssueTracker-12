import React from 'react';
import styled from 'styled-components';
import AddAssigneeSideBar from './AddAssigneeSideBar';
import AddLabelSideBar from './AddLabelSideBar';
import AddMilestoneSideBar from './AddMilestoneSideBar';

const SideBar = () => {
  return (
    <>
      <AddAssigneeSideBar />
      <AddLabelSideBar />
      <AddMilestoneSideBar />
    </>
  )
};

export default SideBar;
