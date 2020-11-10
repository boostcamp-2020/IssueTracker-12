import React from "react";
import PageLayout from "@Components/commons/PageLayout";
import Header from "@Components/commons/Header";
// import IssueMain from './IssueMain';
import LabelStore from "@Stores/LabelStore";

const LabelPage = () => (
  <LabelStore>
    <PageLayout header={<Header />} />
  </LabelStore>
);

export default LabelPage;
