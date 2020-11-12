import React, { useContext, useState } from 'react';
import styled from 'styled-components';
import InputDiv from './InputDiv';
import SideBar from './SideBar';
import { IssueContext } from '@Stores/IssueStore';
import { addIssue, getIssueById } from '@Api/issue';

const NewIssueMain = () => {
  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');

  const [selectedAssignees, setSelectedAssignees] = useState([]);
  const [selectedLabels, setSelectedLabels] = useState([]);
  const [selectedMilestone, setSelectedMilestone] = useState([]);

  const { issueState, dispatch } = useContext(IssueContext);

  const addNewIssue = async (e) => {
    e.preventDefault();
    const newIssueId = await addIssue({
      title: 'title',
      milestoneId: selectedMilestone[0] ? selectedMilestone[0] : null,
      labelArr: selectedLabels,
      assigneeArr: selectedAssignees,
      content
    });
  
    const newIssue = await getIssueById(newIssueId);

    dispatch({type: 'ADD', data: newIssue});
  }

  return (
    <MainContainer>
      <Img src='https://i.imgur.com/oPR4BiX.jpeg'/>
      <InputDiv addNewIssue={addNewIssue} />
      <Info>
        <SideBar 
          selectedAssignees={selectedAssignees}
          setSelectedAssignees={setSelectedAssignees}
          selectedLabels={selectedLabels}
          setSelectedLabels={setSelectedLabels}
          selectedMilestone={selectedMilestone}
          setSelectedMilestone={setSelectedMilestone}
        />
  
      </Info>
    </MainContainer>
  );
}

const MainContainer = styled.div`
  display: flex;
  margin-top: 20px;
  align-items: flex-start;
  padding: 0 30px;
`;

const Img = styled.img`
  align-self: flex-start;
  width: 45px;
  height: 45px;
  border-radius: 50%;
`;

const Info = styled.div`
  width: 30%;
  height: 400px;
`;

export default NewIssueMain;
