import React, { useEffect, useReducer } from 'react';
import { getAllLabels } from '@Api/label';

export const LabelContext = React.createContext();

const labelReducer = (labelState, { type, data }) => {
  switch (type) {
    case 'INIT':
      return data;
    case 'ADD':
      return [...labelState, data];
    case 'DELETE':
      return labelState.filter((label) => label.label_id !== data.label_id);
    case 'UPDATE':
      return labelState.map((label) => (label.label_id === data.label_id ? data : label));
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
