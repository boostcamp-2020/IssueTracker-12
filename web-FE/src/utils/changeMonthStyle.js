export const changeMonthStyle = (month) => {
  const monthInString = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return monthInString[+month - 1];
};
