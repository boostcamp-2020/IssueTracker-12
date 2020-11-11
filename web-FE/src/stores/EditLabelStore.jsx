import React, { useEffect, useState } from 'react';

export const EditLabelContext = React.createContext();

const EditLabelStore = ({ children }) => {
  const [editLabelState, displayEditLabel] = useState('none');
  useEffect(() => {
    displayEditLabel('show');
  }, []);

  return (
    <EditLabelContext.Provider value={{ editLabelState, displayEditLabel }}>
      {children}
    </EditLabelContext.Provider>
  );
};

export default EditLabelStore;
