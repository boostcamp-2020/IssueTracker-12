import jwt_decode from 'jwt-decode';

export const getLoginUserInfo = () => {
  const token = localStorage.getItem('token');

  const user = jwt_decode(token);
  console.log(user);
  return user;
};
