import jwt from 'jsonwebtoken';

const jwtSecret = process.env.JWT_SECRET;

export const getLoginUserInfo = () => {
  const token = localStorage.getItem('token');

  const user = jwt.verify(token, jwtSecret);
  console.log(user);
  return user;
};
