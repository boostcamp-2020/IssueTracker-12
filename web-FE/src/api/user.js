import instance from './instance';

export const getAllUsers = async () => {
  const url = '/api/user';
  try {
    const result = await instance.get(url);
    const { userArray } = result.data;
    return userArray;
  } catch (error) {
    console.error(error);
  }
};
