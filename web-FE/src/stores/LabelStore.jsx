import React, { useEffect, useReducer } from 'react';
import { getAllLabels } from '@Api/label';

export const LabelContext = React.createContext();

const labelReducer = (labelState, {type, data}) => {
  switch (type) {
    case 'INIT':
      return data;
    default:
      return labelState;
  }
};

const LabelStore = ({ children }) => {
  const [labelState, dispatch] = useReducer(labelReducer, []);
  const setInitState = async () => {
    const initState = await getAllLabels();
    dispatch({ type: 'INIT', data: initState.reverse() });
  };
  useEffect(() => {
    setInitState();
  }, []);

  return (
    <LabelContext.Provider value={{ labelState, dispatch }}>
      {children}
    </LabelContext.Provider>
  );
};

export default LabelStore;