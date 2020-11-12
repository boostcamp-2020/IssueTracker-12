import React, { useContext } from 'react';
import styled from 'styled-components';
import { MilestoneContext } from '@Stores/MilestoneStore';
import MilestoneListHeader from './MilestoneListHeader';
import MilestoneListItem from './MilestoneListItem';

const MilestoneListBoard = () => {
  const { milestoneState } = useContext(MilestoneContext);
  let close = 0;
  milestoneState.map((milestone) => {
    const { issueInfo } = milestone;
    if (issueInfo.completed === '100%') close++;
  });
  return (
    <Board>
      <MilestoneListHeader open={milestoneState.length} close={close} />;
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
