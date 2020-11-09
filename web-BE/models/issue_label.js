const connection = require('../config/db_connection');
const sql = require('../config/query');

const issueLabelModel = {
  insert: async (issueId, labelArr) => {
    const issueLabelData = labelArr.reduce((acc, curr) => [...acc, [issueId, curr]], []);
    await connection.query(sql.insertIssueLabel, [issueLabelData]);
  },
  select: async (issueId) => {
    const [res] = await connection.query(sql.selectIssueLabel, [issueId]);
    const convertedResult = res.map((row) => ({ ...row }));
    return convertedResult;
  },
  delete: async (issueId, labelId) => {
    await connection.query(sql.deleteIssueLabel, [issueId, labelId]);
  },
};

module.exports = issueLabelModel;
