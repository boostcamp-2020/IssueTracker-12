import instance from './instance';

export const getAllIssues = async () => {
  const issueUrl = '/api/issue';
  try {
    const result = await instance.get(issueUrl);
    const { issueArr } = result.data;
    return issueArr;
  } catch (error) {
    console.error(error);
  }
};
