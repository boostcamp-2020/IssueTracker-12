import React from "react";
import PageLayout from '@Components/commons/PageLayout';
import Header from '@Components/commons/Header';
import IssueStore from '@Stores/IssueStore';
import UserStore from '@Stores/UserStore';
import LabelStore from "@Stores/LabelStore";
import MilestoneStore from "@Stores/MilestoneStore";
import IssueFilterStore from "@Stores/IssueFilterStore";
import IssueMain from './IssueMain';

const IssuePage = () => (
  <UserStore>
    <MilestoneStore>
      <LabelStore>
        <IssueStore>
          <IssueFilterStore>
            <PageLayout
              header={<Header page="Issue"/>}
              main={<IssueMain />}
            />
          </IssueFilterStore>
        </IssueStore>
      </LabelStore>
    </MilestoneStore>
  </UserStore>
);

export default IssuePage;
