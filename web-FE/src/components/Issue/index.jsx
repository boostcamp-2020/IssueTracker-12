import React from "react";
import PageLayout from '@Components/commons/PageLayout';
import Header from '@Components/commons/Header';
import IssueMain from './IssueMain';

const IssuePage = () => (
  <PageLayout
    header={<Header />}
    main={<IssueMain />}
  />
  );

export default IssuePage;
