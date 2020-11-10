import React from 'react';
import styled from 'styled-components';
import { ReactComponent as Icon } from '@Images/exclamation.svg'

const OpenCloseIndicator = () => (
  <Container>
    <Icon
      width="100%"
      height="100%"
      viewox="0 0 30 30"
      fill="green"
    />
  </Container>
);

const Container = styled.div`
  padding: 8px 0 8px 16px;
  box-sizing: border-box;
  width: 32px;
`;

export default OpenCloseIndicator;
