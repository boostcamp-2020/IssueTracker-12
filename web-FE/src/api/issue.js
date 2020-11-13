import instance from './instance';
import { getLoginUserInfo } from '@Services/auth';
import dateFormat from 'dateformat';

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
}

export const addIssue = async ({ title, milestoneId, labelArr, assigneeArr, content }) => {
  const addIssueurl = '/api/issue';
  const writer = localStorage.getItem('username');
  const writeTime = dateFormat(new Date(), 'yyyy-mm-dd HH:MM:ss');
  try {
    const { data: {insertId: issueId} } = await instance.post(addIssueurl, {
      writer,
      title,
      milestone_id: milestoneId,
      labels: labelArr.length ? labelArr : null,
      write_time: writeTime
    });
    const addCommenturl = `/api/issue/${issueId}/comment`;
    const { data: {insertId: commentId} } = await instance.post(addCommenturl, {
      writer_id: writer.user_id,
      content,
      write_time: writeTime,
      is_issue_content: true,
    });
    return issueId;
  } catch (error) {
    console.error(error);
  }
};

export const getIssueById = async (issueId) => {
  const url = `/api/issue/${issueId}`;
  try {
    const result = await instance.get(url);
    const { issue } = result.data;
    return issue;
  } catch (error) {
    console.error(error);
  }
};
