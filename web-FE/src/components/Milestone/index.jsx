import React from 'react';
import Header from '@Common/Header';
import PageLayout from '@Common/PageLayout';
import MilestoneMain from './MilestoneMain';
import MilestoneStore from '../../stores/MilestoneStore';
import LabelStore from '../../stores/LabelStore';

const MilestonePage = () => (
  <MilestoneStore>
    <LabelStore>
      <PageLayout
        header={<Header page='Milestone' />}
        main={<MilestoneMain />}
      />
    </LabelStore>
  </MilestoneStore>
);

export default MilestonePage;
