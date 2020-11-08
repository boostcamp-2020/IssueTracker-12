import React from "react";
import PageLayout from '@Component/PageLayout';
import Header from '@Component/Header';
import Main from '@Component/Main';

const IssuePage = () => {
  return (
    <PageLayout
      header = { <Header/> }
      main = { <Main text="Issue"/> }
    />
  )
};

export default IssuePage;
