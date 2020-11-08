import React from "react";
import PageLayout from '@Components/PageLayout';
import Header from '@Components/Header';
import Main from '@Components/Main';

const NewIssuePage = () => {
  return (
    <PageLayout
      header = { <Header/> }
      main = { <Main text="New Issue"/> }
    />
  )
};

export default NewIssuePage;
