import { changeMonthStyle } from './changeMonthStyle';

export const changeDateStyle = (dueDate) => {
  const dueDateList = dueDate.split('-');
  const date = dueDateList[0];
  const month = changeMonthStyle(dueDateList[1]);
  const year = dueDateList[2];
  return `${month} ${date}, ${year}`;
};
