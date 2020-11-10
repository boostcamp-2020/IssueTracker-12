import React, { useEffect, useReducer } from 'react';
import { getAllUsers } from '@Api/user';

export const UserContext = React.createContext();

const userReducer = (userState, {type, data}) => {
  switch (type) {
    case 'INIT':
      return data;
    default:
      return userState;
  }
};

const UserStore = ({ children }) => {
  const [userState, dispatch] = useReducer(userReducer, []);
  const setInitState = async () => {
    const initState = await getAllUsers();
    dispatch({ type: 'INIT', data: initState.reverse() });
  };
  useEffect(() => {
    setInitState();
  }, []);

  return (
    <UserContext.Provider value={{ userState, dispatch }}>
      {children}
    </UserContext.Provider>
  );
};

export default UserStore;