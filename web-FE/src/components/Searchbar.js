import React from 'react';
import styled from 'styled-components';
import searchImage from '@Images/search.svg';

const Searchbar = () => {
  return (
    <>

      <SearchInput type="text"/>
    </>
  )
};

const SearchInput = styled.input`
  flex:1;
  border: solid 1px lightgrey;
  background-image: url('images/search.svg');
  background-repeat: no-repeat;
  height: 30px;
  background-origin: content-box;
  padding: 4px;
  box-sizing: border-box;
`;

export default Searchbar;
