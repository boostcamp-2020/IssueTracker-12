import React from "react";
import PageLayout from '@Components/commons/PageLayout';
import Header from '@Components/commons/Header';
import IssueStore from '@Stores/IssueStore';
import IssueFilterStore from "@Stores/IssueFilterStore";
import IssueMain from './IssueMain';

const IssuePage = () => (
  
  <IssueStore>
    <IssueFilterStore>
      <PageLayout
        header={<Header page="Issue"/>}
        main={<IssueMain />}
      />
    </IssueFilterStore>
  </IssueStore>

);

export default IssuePage;
