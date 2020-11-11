import React from 'react';
import PageLayout from '@Common/PageLayout';
import Header from '@Common/Header';
import LabelStore from '@Stores/LabelStore';
import MilestoneStore from '@Stores/MilestoneStore';
import LabelMain from './LabelMain';

const LabelPage = () => (
  <MilestoneStore>
    <LabelStore>
      <PageLayout header={<Header page="Label" />} main={<LabelMain />} />
    </LabelStore>
  </MilestoneStore>
);
export default LabelPage;
