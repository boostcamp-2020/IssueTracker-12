import React, { createContext, useState } from 'react';

export const DisplayContext = createContext({
  state: { display: '' },
  actions: {
    setDisplay: () => {},
  },
});

export const DisplayProvider = ({ children }) => {
  const [display, setDisplay] = useState('none');

  const value = {
    state: { display },
    actions: { setDisplay },
  };

  return (
    <DisplayContext.Provider value={value}>
      {children}
    </DisplayContext.Provider>
  );
};

export const { Consumer: DisplayConsumer } = DisplayContext;
