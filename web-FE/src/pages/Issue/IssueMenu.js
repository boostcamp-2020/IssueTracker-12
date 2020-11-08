import React from 'react';
import styled from 'styled-components';
import Dropdown from '@Components/Dropdown';
import Searchbar from '@Components/Searchbar';
import ButtonWithIcon from '@Components/ButtonWithIcon';
import labelIcon from '@Images/label.svg';
import milestoneIcon from '@Images/milestone.svg';
import Button from '@Components/Button';

const IssueMenu = () => {
  return (
    <>
      <Dropdown/>
      <Searchbar/>
      <ButtonWithIcon 
        image={labelIcon}
        name="label"
        number="3"
      /> 
      <ButtonWithIcon 
        image={milestoneIcon}
        name="milestone"
        number="3"
      />
      <Button>New Issue</Button>
    </>
  )
};

export default IssueMenu;
