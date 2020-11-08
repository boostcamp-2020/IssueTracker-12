import React from "react";
import PageLayout from '../components/PageLayout';
import Header from '../components/Header';
import Main from '../components/Main';

const IssuePage = () => {
  return (
    <PageLayout
      header = { <Header/> }
      main = { <Main text="Issue"/> }
    />
  )
};

export default IssuePage;
