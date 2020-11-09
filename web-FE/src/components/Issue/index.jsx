import React from "react";
import PageLayout from '@Components/commons/PageLayout';
import Header from '@Components/commons/Header';
import IssueMain from './IssueMain';
import IssueStore from '@Stores/IssueStore';

const IssuePage = () => (
  <IssueStore>
    <PageLayout
      header={<Header />}
      main={<IssueMain />}
    />
  </IssueStore>
);

export default IssuePage;
