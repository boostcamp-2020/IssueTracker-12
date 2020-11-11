import React from 'react';
import PageLayout from '@Common/PageLayout';
import Header from '@Common/Header';
import LabelStore from '@Stores/LabelStore';
import EditLabelStore from '@Stores/EditLabelStore';
import LabelMain from './LabelMain';

const LabelPage = () => (
  <LabelStore>
    <EditLabelStore>
      <PageLayout header={<Header page="Label" />} main={<LabelMain />} />
    </EditLabelStore>
  </LabelStore>
);
export default LabelPage;
