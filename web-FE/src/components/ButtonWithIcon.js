import React from 'react';
import styled from 'styled-components';

const ButtonWithIcon = (props) => {
  return (
    <>
      <a>
        <Img src={props.image}/>
        {props.name}
        <NumberIndicator>
          {props.number}
        </NumberIndicator>
      </a>
    </>
  )
};

const NumberIndicator = styled.span`
  min-width: 20px;
  padding: 0 6px;
  font-size: 12px;
  font-weight: 500;
  line-height: 18px;
  color: var(--color-counter-text);
  text-align: center;
  background-color: var(--color-counter-bg);
  border: 1px solid transparent;
  border-radius: 2em;
`;

const Img = styled.img`
  height:20px;
  width:20px;
`;

export default ButtonWithIcon;
