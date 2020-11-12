import React, { useState, useContext } from 'react';
import styled from 'styled-components';
import { ReactComponent as GearIcon } from '@Images/gear.svg';
import { MilestoneContext } from '@Stores/MilestoneStore';
import MilestoneSelector from './MilestoneSelector';

const AddMilestoneSideBar = () => {
  const [selected, setSelected] = useState([]);
  const { milestoneState } = useContext(MilestoneContext);
  console.log(milestoneState);
  const getMilestoneObjectById = (milestoneId) => milestoneState.find((milestone) => milestone.milestone_id === milestoneId);
  return (
    <Div>
      <FlexColumn>
        <MilestoneSelector
          selected={selected}
          setSelected={setSelected}
          milestoneState={milestoneState}
        />
        <GearIcon
          width="16px"
          height="16px"
        />
      </FlexColumn>
      <Item>{getMilestoneObjectById(selected[0])?.title}</Item>
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
  width: 280px;
  min-height: 60px;
  padding: 20px;
  border-bottom: 1px solid lightgrey;
  box-sizing:border-box;
`;

export default AddMilestoneSideBar;
