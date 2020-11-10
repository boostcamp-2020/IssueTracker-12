import React from 'react';
import styled from 'styled-components';
import LabelBadge from '@Components/commons/LabelBadge';

const LabelListItem = (props) => {
  const { label } = props;

  const {
    // label_id: labelId,
    label_name: labelName,
    description,
    color,
  } = label;
  return (
    <FlexRowDiv>
      <LabelContent>
        <LeftDiv>
          <LabelBadge name={labelName} color={color} />
          <Description>
            {description}
          </Description>
        </LeftDiv>
        <RightDiv>
          <P>Edit</P>
          <P>Delete</P>
        </RightDiv>
      </LabelContent>
    </FlexRowDiv>
  );
};

const FlexRowDiv = styled.div`
  display:flex;
  flex-direction: row;
  align-items: center;
  height: 50px;
  border-right: 1px solid #e1e4e8;
  border-left: 1px solid #e1e4e8;
  border-bottom: 1px solid #e1e4e8;
  background-color: white;
`;

const LabelContent = styled.div`
  display: flex;
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
`;

const RightDiv = styled.div`
  display: flex;
`;

export default LabelListItem;
