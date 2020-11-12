import React, { useState } from 'react';
import styled from 'styled-components';
import Button from '@Common/Button';

const InputDiv = ({ addNewIssue, setTitle, setContent }) => {
  const [onWrite, setWrite] = useState('true');
  const [onPreview, setPreview] = useState('false');

  const selectTab = (e) => {
    const target = e.target.innerText;
    if (target === 'Write') {
      setWrite('true');
      setPreview('false');
      return;
    }
    setWrite('false');
    setPreview('true');
  };

  const onTitleChange = ({target}) => {
    const { value } = target;
    setTitle(value);
  };
  const onContentChange = ({target}) => {
    const { value } = target;
    setContent(value);
  }

  return (
    <MainContainer>
      <Title placeholder="Title" onChange={onTitleChange} />
      <Header>
        <P onClick={selectTab} select={onWrite}>Write</P>
        <P onClick={selectTab} select={onPreview}>Preview</P>
      </Header>
      <CommentContainer>
        <TextArea placeholder="Leave a comment" onChange={onContentChange} />
      </CommentContainer>
      <SubmitButton onClick={ addNewIssue }> Submit new issue </SubmitButton>
    </MainContainer>
  );
};

const border = 'border: 1px solid #e1e4e8;';

const MainContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0 10px;
  width: 70%;
  height: 400px;
  border-radius: 5px;
  ${border}
`;

const Title = styled.input`
  width: 93%;
  height: 32px;
  margin: 10px 5px 0 5px;
  border-radius: 5px;
  ${border}
  background-color: #f6f8fa;
  font-size: 18px;
  font-weight: 100;
  padding-left: 12px;
`;

const Header = styled.div`
  display:flex;
  flex-direction: row;
  height: 60px;
  align-self: stretch;
  margin-left:10px;
  align-items: flex-end;
`;

const P = styled.p`
  position: relative;
  top: 1px;
  width: 75px;
  height: 25px;
  ${border};
  border-color : ${(props) => {
    if (props.select === 'true') return '#e1e4e8;';
    return 'transparent;';
  }};
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  border-bottom: 0;
  text-align: center;
  margin-bottom:0px;
  padding-top: 12px;
  background-color: ${(props) => {
    if (props.select === 'true') return '#ffffff';
    return 'transparant';
  }};
`;

const CommentContainer = styled.div`
  display: flex;
  justify-content: center;
  ${border}
  width:100%;
  height:70%;
  margin:0px;
`;

const TextArea = styled.textarea`
  width: 87%;
  height: 70%;
  padding: 20px;
  margin-top: 10px;
  ${border}
  border-radius: 5px;
  background-color: #f6f8fa;
`;

const SubmitButton = styled(Button)`
  height: 25px;
  display: flex;
  align-items: center;
  align-self: flex-end;
  margin: 8px 10px;
`;

export default InputDiv;
