import instance from './instance';

export const getAllMilestones = async () => {
  const url = '/api/milestone';
  try {
    const result = await instance.get(url);
    const { milestoneArray } = result.data;
    return milestoneArray;
  } catch (error) {
    console.error(error);
  }
};

export const createMilestone = async (title, dueDate, content) => {
  const url = '/api/milestone';
  const body = { title, dueDate, content };
  try {
    await instance.post(url, body);
  } catch (error) {
    console.error(error);
  }
};

export const updateMilestone = async (id, title, dueDate, content) => {
  const url = `/api/milestone/${id}`;
  const body = { title, dueDate, content };
  try {
    await instance.put(url, body);
  } catch (error) {
    console.error(error);
  }
};

export const deleteLabel = async (id) => {
  const url = `/api/milestone/${id}`;
  try {
    await instance.delete(url);
  } catch (error) {
    console.error(error);
  }
};
