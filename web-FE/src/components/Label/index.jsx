import React from 'react';
import PageLayout from '@Components/commons/PageLayout';
import Header from '@Components/commons/Header';
import LabelStore from '@Stores/LabelStore';
import LabelMain from './LabelMain';

const LabelPage = () => (
  <LabelStore>
    <PageLayout header={<Header page="Label" />} main={<LabelMain />} />
  </LabelStore>
);
export default LabelPage;
