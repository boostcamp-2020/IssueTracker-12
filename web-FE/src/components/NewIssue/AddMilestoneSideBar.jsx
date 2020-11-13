import React, { useState, useContext } from 'react';
import styled from 'styled-components';
import { ReactComponent as GearIcon } from '@Images/gear.svg';
import { MilestoneContext } from '@Stores/MilestoneStore';
import MilestoneSelector from './MilestoneSelector';

const AddMilestoneSideBar = ({
  selectedMilestone,
  setSelectedMilestone,
}) => {
  const { milestoneState } = useContext(MilestoneContext);
  const getMilestoneObjectById = (milestoneId) => milestoneState.find((milestone) => milestone.milestone_id === milestoneId);
  return (
    <Div>
      <FlexColumn>
        <MilestoneSelector
          selected={selectedMilestone}
          setSelected={setSelectedMilestone}
          milestoneState={milestoneState}
        />
        <GearIcon
          width="16px"
          height="16px"
          fill="#727272"
        />
      </FlexColumn>
      <Item>
        {
          selectedMilestone.length !== 0
            ? getMilestoneObjectById(selectedMilestone[0])?.title
            : 'No milestone'
        }
      </Item>
    </Div>
  )
}

const FlexColumn = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
`;

const Item = styled.div`
  display: flex;
  flex-wrap: wrap;
  padding: 0;
  width: 100%;
  box-sizing:border-box;
  font-size: 12px;
  color: #757575;
`;

const Div = styled.div`
  width: 100%;
  min-height: 80px;
  padding: 10px;
  border-bottom: 1px solid lightgrey;
  box-sizing:border-box;
`;

export default AddMilestoneSideBar;
