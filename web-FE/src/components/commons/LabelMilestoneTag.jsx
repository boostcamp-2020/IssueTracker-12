import React, { useContext } from 'react';
import styled from 'styled-components';
import labelIcon from '@Images/label.svg';
import milestoneIcon from '@Images/milestone.svg';
import { MilestoneContext } from '@Stores/MilestoneStore';
import { LabelContext } from '@Stores/LabelStore';
import ButtonWithIcon from './ButtonWithIcon';

const goTo = (e) => {
  const targetButton = e.target.closest('.tag');
  const isLabelButton = targetButton.classList.contains('label-button');
  if (isLabelButton) {
    location.href = '/label';
    return;
  }
  location.href = '/milestone';
};

const App = () => {
  const { milestoneState } = useContext(MilestoneContext);
  const { labelState } = useContext(LabelContext);
  return (
    <Div onClick={goTo}>
      <LabelButton
        className="tag label-button"
        image={labelIcon}
        name="label"
        number={labelState.length}
        to="/label"
      />
      <MilestoneButton
        className="tag milestone-button"
        image={milestoneIcon}
        name="milestone"
        number={milestoneState.length}
        to="/milestone"
      />
    </Div>
  );
};

const common = `
  height: 35px;
  box-sizing: border-box;
  border: 1px solid lightgrey;
  padding: 0 10px;
`;

const LabelButton = styled(ButtonWithIcon)`
  ${common}
  border-radius: 5px 0 0 5px;
`;

const MilestoneButton = styled(ButtonWithIcon)`
  ${common}
  border-radius: 0 5px 5px 0;
`;

const Div = styled.div`
  display: flex;
`;

export default App;
