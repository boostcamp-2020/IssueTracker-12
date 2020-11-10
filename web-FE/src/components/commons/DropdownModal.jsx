import React from 'react';
import styled from 'styled-components';

const DropdownModal = ({list}) => (
  <>
    <DetailsModal>
      {
        list?.map(v => (
          <Li key={v.id}>{v.title}</Li>
        ))
      }
    </DetailsModal>
  </>
);

const DetailsModal = styled.ul`
  display: flex;
  width: 300px;
  max-height: 600px;
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

const Li = styled.li`
  display:flex;
  align-items: center;
  width: 100%;
  height: 30px;
  box-sizing: border-box;
  padding: 5px 5px;
  border-bottom: 1px solid lightgrey;
`;

export default DropdownModal;
