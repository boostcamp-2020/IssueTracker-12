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
  padding: 10px 10px;
  width: 100%;
  box-sizing:border-box;
  font-size: 14px;
`;

const Div = styled.div`
  width: 100%;
  min-height: 60px;
  padding: 20px;
  border-bottom: 1px solid lightgrey;
  box-sizing:border-box;
`;

export default AddMilestoneSideBar;
