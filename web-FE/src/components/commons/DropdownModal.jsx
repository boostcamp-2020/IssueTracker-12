import React from 'react';
import styled from 'styled-components';

const DropdownModal = () => (
  <>
    <DetailsModal>
      <li>open issues and pull requests</li>
      <li>Your issues</li>
      <li>Your requests</li>
    </DetailsModal>
  </>
);

const DetailsModal = styled.ul`
  display: flex;
  position: absolute;
  flex-direction: column;
  z-index: 10;
  list-style-type : none;
  padding: 0;
  background-color: white;
  box-shadow: grey 0px 0px 4px 0px;
  border-radius: 5px;
}
`;

export default DropdownModal;
