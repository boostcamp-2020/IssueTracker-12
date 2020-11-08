import React from "react";
import PageLayout from '@Components/PageLayout';
import Header from '@Components/Header';
import IssueMain from './IssueMain';

const IssuePage = () => {
  return (
    <PageLayout
      header = { <Header/> }
      main = { <IssueMain/> }
    />
  )
};

export default IssuePage;
