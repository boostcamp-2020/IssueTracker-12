import React from 'react';
import styled from 'styled-components';
import logoImage from '@Images/logo.svg';
import {Link} from 'react-router-dom';

const Title = () => {
  return (
    <LinkToHome to='/'>
      <LogoImage src={logoImage}/>
      <TitleText>Issues</TitleText>
    </LinkToHome>
  )
};

const Header = () => {
  return (
    <HeaderBackground>
      <Title/>
    </HeaderBackground>
  )
}

const FlexRow = `
  display: flex;
  flex-direction: row;
`;

const HeaderBackground = styled.header`
  ${FlexRow}
  justify-content: center;
  align-items: center;
  height: 100px;
  background-color: black;
  color: white;
`;

const LinkToHome = styled(Link)`
  ${FlexRow}
  justify-content: center;
  align-items: center;
  width: 30px;
  height:30px;
  text-decoration: none;
`;

const TitleText = styled.div`
  font-size: 25px;
  color: white;
  font-weight: bold;
`

const LogoImage = styled.img`
  width: 100%;
  height: 100%;
  filter: invert(1);
`;

export default Header;
