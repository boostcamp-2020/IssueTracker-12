import React from 'react';
import styled from 'styled-components';

const ButtonWithIcon = ({
  image, name, number, className,
}) => (
  <>
    <Button className={className}>
      <Img src={image} />
      {name}
      <NumberIndicator>
        {number}
      </NumberIndicator>
    </Button>
  </>
);

const Button = styled.a`
  display: flex;
  justify-content: center;
  align-items: center;
`;

const NumberIndicator = styled.span`
  min-width: 20px;
  font-size: 12px;
  font-weight: 500;
  text-align: center;
  border: 1px solid transparent;
  border-radius: 2em;
`;

const Img = styled.img`
  height:20px;
  width:20px;
  margin-right: 2px;
`;

export default ButtonWithIcon;
