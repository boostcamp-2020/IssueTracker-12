import React, { useContext } from 'react';
import styled from 'styled-components';
import { MilestoneContext } from '@Stores/MilestoneStore';
import MilestoneListHeader from './MilestoneListHeader';
import MilestoneListItem from './MilestoneListItem';
const MilestoneListBoard = () => {
  const { milestoneState } = useContext(MilestoneContext);

  return (
    <Board>
      <MilestoneListHeader />
      {milestoneState.map((milestone) => {
        const { milestone_id: milestoneId } = milestone;
        return <MilestoneListItem milestone={milestone} key={milestoneId} />;
      })}
    </Board>
  );
};

const Board = styled.div`
  display: flex;
  flex-direction: column;
  margin: 30px 40px 0 30px;
  align-items: stretch;
  width: 100%;
`;

export default MilestoneListBoard;
