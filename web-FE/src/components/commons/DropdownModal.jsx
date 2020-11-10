import React from 'react';
import styled from 'styled-components';

const DropdownModal = ({list}) => (
  <>
    <DetailsModal>
      {
        list?.map(v => (<li key={v.id}>{v.title}</li>))
      }
    </DetailsModal>
  </>
);

const DetailsModal = styled.ul`
  display: flex;
  width: 300px;
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
