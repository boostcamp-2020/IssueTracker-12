import React, { useState, useMemo } from 'react';
import styled from 'styled-components';

import { createEditor } from 'slate';
import { Slate, Editable, withReact } from 'slate-react';

const InputDiv = () => {
  const editor = useMemo(() => withReact(createEditor()), []);

  const [value, setValue] = useState([
    {
      type: 'paragraph',
      children: [{ text: 'A line of text in a paragraph.' }],
    },
  ]);

  return (
    <MainContainer>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/6.23.0/polyfill.min.js" />
      <Title placeholder="Title" />
      <Header>
        <P>Write</P>
        <P>Preview</P>
      </Header>
      <CommentContainer>
        <Slate editor={editor} value={value} onChange={(newValue) => setValue(newValue)}>
          <Editable />
        </Slate>
      </CommentContainer>
    </MainContainer>
  );
};

const MainContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 70%;
  height: 400px;
  border-radius: 5px;
  border: 1px solid #e1e4e8;
`;

const Title = styled.input`
  width: 93%;
  height: 30px;
  margin: 5px;
  border-radius: 5px;
  border: 1px solid #e1e4e8;
  background-color: #f6f8fa;
  font-size: 18px;
  font-weight: 100;
  padding-left: 12px;
`;

const Header = styled.div`
  position: relative;
  top: 1px;
  display:flex;
  flex-direction: row;
  height: 60px;
  align-self: stretch;
  margin-left:10px;
  align-items: flex-end;
`;

const P = styled.p`
  width: 75px;
  height: 25px;
  border: 1px solid #e1e4e8;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  border-bottom: 0;
  text-align: center;
  margin-bottom:0px;
  padding-top: 12px;
  background-color: #ffffff;
`;

const CommentContainer = styled.div`
  display: flex;
  justify-content: center;
  border: 1px solid #e1e4e8;
  width:100%;
  height:70%;
  margin:0px;
`;

const TextArea = styled.textarea`
  width: 90%;
  height: 90%;
  margin-top: 10px;
`;

export default InputDiv;
