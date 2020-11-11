import React, { createContext, useState } from 'react';

export const DisplayContext = createContext({
  state: { display: 'flex' },
  actions: {
    setDisplay: () => {},
  },
});

export const DisplayProvider = ({ children }) => {
  const [display, setDisplay] = useState('flex');

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
