import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';

const ButtonWithIcon = ({
  image, name, number, className, to
}) => (
  <>
    <Button className={className} to={to}>
      <Img src={image} />
      {name}
      <NumberIndicator>
        {number}
      </NumberIndicator>
    </Button>
  </>
);

const Button = styled(Link)`
  display: flex;
  justify-content: center;
  align-items: center;
  cursor:pointer;
  text-decoration:none;
  color:black;
`;

const NumberIndicator = styled.span`
  min-width: 20px;
  font-size: 12px;
  font-weight: 500;
  text-align: center;
  border-radius: 2em;
  background-color: lightgrey;
  margin-left: 5px;
`;

const Img = styled.img`
  height:20px;
  width:20px;
  margin-right: 5px;
`;

export default ButtonWithIcon;
