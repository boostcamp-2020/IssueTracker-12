const createError = require("http-errors");
const connection = require('../config/db_connection');
const sql = require('../config/query');

const issueLabelModel = {
  insert: async (issueId, labelArr) => {
    if (!labelArr) return;
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
  update: async (issueId, labelArr) => {
    await connection.beginTransaction();
    try {
      await connection.query(sql.bulkDeleteIssueLabel, [issueId]);
      if (labelArr.length) await issueLabelModel.insert(issueId, labelArr);
      await connection.commit();
    } catch (err) {
      console.error(err);
      connection.rollback();
      throw createError(500);
    }
  }
};

module.exports = issueLabelModel;
