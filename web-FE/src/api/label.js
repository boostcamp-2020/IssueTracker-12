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

export const createLabel = async (name, description, color) => {
  const url = '/api/label';
  const body = { name, description, color };
  try {
    await instance.post(url, body);
  } catch (error) {
    console.error(error);
  }
};

export const updateLabel = async (id, name, description, color) => {
  const url = `/api/label/${id}`;
  const body = { label_name: name, description, color };
  try {
    await instance.put(url, body);
  } catch (error) {
    console.error(error);
  }
};

export const deleteLabel = async (labelId) => {
  const url = `/api/label/${labelId}`;
  try {
    await instance.delete(url);
  } catch (error) {
    console.error(error);
  }
};
