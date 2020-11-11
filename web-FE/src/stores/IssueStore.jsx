/* eslint-disable import/no-unresolved */
import React, { useEffect, useReducer } from 'react';
import { getAllIssues } from '@Api/issue';

export const IssueContext = React.createContext();

const issueReducer = (issueState, { type, data }) => {
  switch (type) {
    case 'INIT':
      return data;
    case 'ADD':
      return [...issueState, data];
    case 'UPDATE':
      return issueState.map((issue) => (issue.issue_id === data.issue_id ? data : issue));
    default:
      return issueState;
  }
};

const IssueStore = ({ children }) => {
  const [issueState, dispatch] = useReducer(issueReducer, []);
  const setInitState = async () => {
    const initState = await getAllIssues();
    dispatch({ type: 'INIT', data: initState.reverse() });
  };
  useEffect(() => {
    setInitState();
  }, []);

  return (
    <IssueContext.Provider value={{ issueState, dispatch }}>
      {children}
    </IssueContext.Provider>
  );
};

export default IssueStore;
