import React from 'react';
import Header from '@Common/Header';
import PageLayout from '@Common/PageLayout';
import MilestoneMain from './MilestoneMain';
import MilestoneStore from '../../stores/MilestoneStore';

const MilestonePage = () => (
  <MilestoneStore>
    <PageLayout header={<Header page='Milestone' />} main={<MilestoneMain />} />
  </MilestoneStore>
);

export default MilestonePage;
