import React, { useEffect, useReducer } from 'react';
import { getAllMilestones } from '@Api/milestone';

export const MilestoneContext = React.createContext();

const milestoneReducer = (milestoneState, {type, data}) => {
  switch (type) {
    case 'INIT':
      return data;
    default:
      return milestoneState;
  }
};

const MilestoneStore = ({ children }) => {
  const [milestoneState, dispatch] = useReducer(milestoneReducer, []);
  const setInitState = async () => {
    const initState = await getAllMilestones();
    dispatch({ type: 'INIT', data: initState.reverse() });
  };
  useEffect(() => {
    setInitState();
  }, []);

  return (
    <MilestoneContext.Provider value={{ milestoneState, dispatch }}>
      {children}
    </MilestoneContext.Provider>
  );
};

export default MilestoneStore;