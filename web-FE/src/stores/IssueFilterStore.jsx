import React, { useEffect, useState } from 'react';

export const IssueFilterContext = React.createContext();

const initFilterState = {
  menuFilter: null,
  authorFilter: null,
  labelFilter: [],
  milestoneFilter: null,
  assigneeFilter: null,
};


const IssueFilterStore = ({children}) => {
  const [filterState, setFilterState] = useState(initFilterState);
  useEffect(() => {
    setFilterState(initFilterState);
  }, []);

  return (
    <IssueFilterContext.Provider value={{filterState, setFilterState}}>
      {children}
    </IssueFilterContext.Provider>
  );
};

export default IssueFilterStore;
