const connection = require('../config/db_connection');
const sql = require('../config/query');

const issueLabelModel = {
  insert: async (issueId, labelArr) => {
    const issueLabelData = labelArr.reduce((acc, curr) => [...acc, [issueId, curr]], []);
    console.log('asdfsddfsef', issueLabelData);
    await connection.query(sql.insertIssueLabel, [issueLabelData]);
  },
};

module.exports = issueLabelModel;
