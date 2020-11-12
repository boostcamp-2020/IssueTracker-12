/* eslint-disable import/no-unresolved */
import React, { useEffect, useReducer } from 'react';
import { getAllIssues, updateIsOpen } from '@Api/issue';

export const IssueContext = React.createContext();

const issueReducer = (issueState, { type, data }) => {
  switch (type) {
    case 'INIT':
      return data;
    case 'ADD':
      return [...issueState, data];
    case 'UPDATE':
      return issueState.map((issue) => (issue.issue_id === data.issue_id ? data : issue));
    case 'CLOSE':
      updateIsOpen(data, false);
      return issueState.map((issue) => (
        data.includes(issue.issue_id)
          ? { ...issue, is_open: false }
          : issue));
    case 'OPEN':
      updateIsOpen(data, true);
      return issueState.map((issue) => (
        data.includes(issue.issue_id)
          ? { ...issue, is_open: true }
          : issue));
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
