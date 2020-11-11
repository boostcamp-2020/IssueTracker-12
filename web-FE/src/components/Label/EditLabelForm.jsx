import React, { useContext, useState } from 'react';
import { EditLabelContext } from '@Stores/EditLabelStore';
import LabelBadge from '@Common/LabelBadge';
import { EditLabelFormStyle } from './style';

const EditLabelForm = () => {
  const { editLabelState, displayEditLabel } = useContext(EditLabelContext);
  const [color, setColor] = useState('#6f849e');
  return (
    <MainContainer className="main-container" display={editLabelState}>
      <BadgeContainer>
        <LabelBadge name={name} color={color} />
      </BadgeContainer>
    </MainContainer>
  );
};

const {
  MainContainer,
  BadgeContainer,
} = EditLabelFormStyle;

export default EditLabelForm;
