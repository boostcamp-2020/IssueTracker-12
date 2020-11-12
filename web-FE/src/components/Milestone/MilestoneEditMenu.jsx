import React from 'react';
import styled from 'styled-components';

const MilestoneEditMenu = () => (
  <MilestoneEditMenus>
    <EditMilestone>Edit</EditMilestone>
    <CloseMilestone>Close</CloseMilestone>
    <DeleteMilestone>Delete</DeleteMilestone>
  </MilestoneEditMenus>
);

const MilestoneEditMenus = styled.div`
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  width: 45%;
`;

const EditMilestone = styled.span`
  color: #1155cc;
`;
const CloseMilestone = styled.span`
  color: #1155cc;
`;
const DeleteMilestone = styled.span`
  color: #c5221f;
`;
export default MilestoneEditMenu;
