import React from 'react';
import styled from 'styled-components';
import LabelBadge from '@Common/LabelBadge';
import Button from '@Common/Button';
import RefreshIcon from '@Images/refresh.svg';

const NewLabelForm = () => {
  const labelName = 'Label Preview';
  const color = '#6783a7';
  return (
    <MainContainer>
      <BadgeContainer>
        <LabelBadge name={labelName} color={color} />
      </BadgeContainer>
      <OptionContainer>
        <Option width="30%">
          <P>Label name</P>
          <Input placeholder="Label name" />
        </Option>
        <Option width="60%">
          <P>Description</P>
          <Input placeholder="Description (optional)" for="descript" />
        </Option>
        <Option width="20%">
          <P>Color</P>
          <ColorButton backgroundColor="#6f849e">
            <Img src={RefreshIcon} />
          </ColorButton>
          <Input defaultValue="#bfd4f2" width="70%" />
        </Option>
        <Option width="20%">
          <CancelButton color="#181818" backgroundColor="#fff">Cancel</CancelButton>
          <CreateButton>Create label</CreateButton>
        </Option>
      </OptionContainer>
    </MainContainer>
  );
};
const BadgeContainer = styled.div`
  margin: 10px 0 0 15px;
`;

const MainContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  border: 1px solid #120342 ; 
  margin: 30px 40px 0 40px;
  align-items: flex-start;
  width: 100%;
  background-color: #ececec;
  border-radius: 5px;
  border: 1px solid #e1e4e8;
`;

const OptionContainer = styled.div`
  display: flex;
  margin: 10px 15px;
  width:100%;
  justify-content:space-between;
`;

const P = styled.p`
  margin: 5px;
`;

const Option = styled.div`
  width: ${(props) => props.width};
  margin-right: 20px;
  align-self: flex-end;
`;

const Input = styled.input`
  background-color:transparent;
  border: 1px solid #a3a3a3;
  width:${(props) => props.width || '100%'};
  height: 30px;
`;

const Img = styled.img`
  height:15px;
  width:15px;
  margin-right: 2px;
`;

const buttonSet = `
  display: inline-flex;
  justify-content: center;
  align-items: center;
  padding: 0;
  height: 32px;
  border: 1px solid#a3a3a3;
  border-radius: 3px;
`;

const ColorButton = styled(Button)`
  ${buttonSet}
  width: 30px;
  margin-right: 5px;
  font-size: 10px;
  font-weight: 200;
`;

const CancelButton = styled(Button)`
  ${buttonSet}
  padding: 0 10px;
`;
const CreateButton = styled(Button)`
  ${buttonSet}
  margin-left:5px;
  padding: 0 10px;
`;

export default NewLabelForm;
