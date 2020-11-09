import React, { useEffect, useReducer } from 'react';

const IssuesContext = React.createContext();

const issueReducer = (issueState, {type, data}) => {
  switch (type) {
    case 'INIT':
      return data;
    case 'ADD':
      return [...issueState, data];
    case 'UPDATE':
      return issueState.map((issue) => issue.issue_id === data.issue_id ? data : issue);
    default:
      return issues;
  }
}

const IssueStore = ({ children }) => {
  const [issueState, dispatch] = useReducer(issueReducer, []);
  const setInitState = async () => {
    // const initState = await issueAPI.readAll();
    dispatch({ type: 'INIT', data: initState.reverse() });
  };
  useEffect(() => {
    setInitState();
  }, []);

  return (
    <IssuesContext.Provider value={{ issueState, dispatch }}>
      {children}
    </IssuesContext.Provider>
  );
}

export default IssueStore;
