import React from "react";
import PageLayout from '@Components/commons/PageLayout';
import Header from '@Components/commons/Header';
import IssueStore from '@Stores/IssueStore';
import UserStore from '@Stores/UserStore';
import LabelStore from "@Stores/LabelStore";
import IssueMain from './IssueMain';
import MilestoneStore from "../../stores/MilestoneStore";

const IssuePage = () => (
  <UserStore>
    <MilestoneStore>
      <LabelStore>
        <IssueStore>
          <PageLayout
            header={<Header />}
            main={<IssueMain />}
          />
        </IssueStore>
      </LabelStore>
    </MilestoneStore>
  </UserStore>
);

export default IssuePage;
