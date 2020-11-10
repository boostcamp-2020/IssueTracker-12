import instance from './instance';

export const getAllLabels = async () => {
  const url = '/api/label';
  try {
    const result = await instance.get(url);
    const { labelArray } = result.data;
    return labelArray;
  } catch (error) {
    console.error(error);
  }
};
