import React from "react";
import PageLayout from '@Component/PageLayout';
import Header from '@Component/Header';
import Main from '@Component/Main';

const NewIssuePage = () => {
  return (
    <PageLayout
      header = { <Header/> }
      main = { <Main text="New Issue"/> }
    />
  )
};

export default NewIssuePage;
