import React from 'react';
import styled from 'styled-components';
import AddAssigneeSideBar from './AddAssigneeSideBar';
import AddLabelSideBar from './AddLabelSideBar';
import AddMilestoneSideBar from './AddMilestoneSideBar';

const SideBar = ({
  selectedAssignees,
  setSelectedAssignees,
  selectedLabels,
  setSelectedLabels,
  selectedMilestone,
  setSelectedMilestone,
}) => {
  return (
    <Div>
      <AddAssigneeSideBar
        selectedAssignees={selectedAssignees}
        setSelectedAssignees={setSelectedAssignees}
      />
      <AddLabelSideBar
        selectedLabels={selectedLabels}
        setSelectedLabels={setSelectedLabels}
      />
      <AddMilestoneSideBar
        selectedMilestone={selectedMilestone}
        setSelectedMilestone={setSelectedMilestone}
      />
    </Div>
  )
};

const Div = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
`;

export default SideBar;
