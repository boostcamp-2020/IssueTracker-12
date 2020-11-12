import { getLoginUserInfo } from '@Services/auth';

const filterByMenu = (issueList, selection) => {
  if (selection === 1) {
    return issueList.filter((issue) => issue.is_open);
  }
  if (selection === 2) {
    const user = getLoginUserInfo();
    return issueList.filter((issue) => issue.writer_id === user.user_id);
  }
  if (selection === 3) {
    return issueList.filter((issue) => issue.is_assigned);
  }
  if (selection === 4) {
    return issueList.filter((issue) => issue.is_mentioned);
  }
  if (selection === 5) {
    return issueList.filter((issue) => !issue.is_open);
  }
  return issueList;
};

const filter = (issueList, filterState) => {
  const {
    menuFilter,
    authorFilter,
    labelFilter,
    milestoneFilter,
    assigneeFilter,
  } = filterState;
  return filterByMenu(issueList, menuFilter[0])
    .filter((issue) => !authorFilter.length || issue.writer_id === authorFilter[0])
    .filter((issue) => !labelFilter.length || labelFilter.some((labelInFilter) => issue.labels.some(((label) => label.label_id === labelInFilter))))
    .filter((issue) => !milestoneFilter.length || issue.milestone_id === milestoneFilter[0])
    .filter((issue) => !assigneeFilter.length || issue.assignee.some((assigneeItem) => assigneeItem.user_id === assigneeFilter[0]));
};

export default filter;
