import React, { useState, useContext } from 'react';
import styled from 'styled-components';
import { ReactComponent as GearIcon } from '@Images/gear.svg';
import { UserContext } from '@Stores/UserStore';
import AssigneeSelector from './AssigneeSelector';

const AddAssigneeSideBar = () => {
  const [assginess, setAssignees] = useState([]);
  const { userState } = useContext(UserContext);
  const getUsername = (userId) => userState.find((user) => user.user_id === userId).username;
  return (
    <Div>
      <FlexColumn>
        <AssigneeSelector
          selected={assginess}
          setSelected={setAssignees}
          userState={userState}
        />
        <GearIcon
          width="16px"
          height="16px"
        />
      </FlexColumn>
      {
        assginess.length !== 0
          ? assginess.map((assginee) => (<Item key={assginee}>{getUsername(assginee)}</Item>))
          : (<Item>No one</Item>)
      }
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

export default AddAssigneeSideBar;
