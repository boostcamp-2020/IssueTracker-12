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

export const updateIsOpen = (issueIdList, isOpen) => {
  try {
    issueIdList.forEach((issueId) => {
      const url = `/api/issue/${issueId}/isopen`;
      instance.patch(url, { is_open: isOpen });
    });
  } catch (error) {
    console.error(error);
  }
};
