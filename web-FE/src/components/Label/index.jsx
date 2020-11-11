import React from 'react';
import PageLayout from '@Common/PageLayout';
import Header from '@Common/Header';
import LabelStore from '@Stores/LabelStore';
import LabelMain from './LabelMain';

const LabelPage = () => (
  <LabelStore>
    <PageLayout header={<Header page="Label" />} main={<LabelMain />} />
  </LabelStore>
);
export default LabelPage;
