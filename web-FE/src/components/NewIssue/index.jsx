import React from 'react';
import PageLayout from '@Common/PageLayout';
import Header from '@Common/Header';
import NewIssueMain from './NewIssueMain'

const LabelPage = () => (
  <PageLayout header={<Header page="Issue" />} main={<NewIssueMain />} />
);
export default LabelPage;
