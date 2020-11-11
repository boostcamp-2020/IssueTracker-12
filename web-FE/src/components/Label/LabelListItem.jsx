import React from 'react';
import styled from 'styled-components';
import LabelBadge from '@Common/LabelBadge';
import { EditDisplayConsumer } from '@Stores/EditLabelContext';
import EditLabelForm from './EditLabelForm';

const LabelListItem = (props) => {
  const { label, dispatch } = props;
  const {
    // label_id: labelId,
    label_name: labelName,
    description,
    color,
  } = label;

  const onClickDelHandler = () => {
    dispatch({ type: 'DELETE', data: label });
  };

  return (
    <FlexRowDiv>
      <LabelContent>
        <LeftDiv>
          <LabelBadge name={labelName} color={color} />
          <Description>
            {description}
          </Description>
        </LeftDiv>
        <EditDisplayConsumer>
          {({ actions }) => (
            <RightDiv>
              <P onClick={() => { actions.setDisplay('flex'); }}>Edit</P>
              <P onClick={onClickDelHandler}>Delete</P>
            </RightDiv>
          )}
        </EditDisplayConsumer>
      </LabelContent>
      <EditLabelForm />
    </FlexRowDiv>
  );
};

const FlexRowDiv = styled.div`
  display: ${(props) => props.display};
  flex-direction: row;
  flex-direction: column;
  align-items: center;
  height: fit-content;
  border-right: 1px solid #e1e4e8;
  border-left: 1px solid #e1e4e8;
  border-bottom: 1px solid #e1e4e8;
  background-color: white;
`;

const LabelContent = styled.div`
  display: flex;
  width: 95%;
  justify-content: space-between;
  padding: 8px 15px;
  flex: 1;
`;

const LeftDiv = styled.div`
  display: flex;
  width: 80%;
  justify-content: space-between;
  align-items: center;
`;

const Description = styled.p`
  width: 70%;
  color: #181818;
  font-size:12px;
`;

const P = styled.p`
  margin-left:10px;
  width: 70%;
  color: #181818;
  font-size:13px;
  cursor: pointer;
`;

const RightDiv = styled.div`
  display: flex;
`;

export default LabelListItem;
