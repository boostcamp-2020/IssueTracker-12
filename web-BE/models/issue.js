const createError = require('http-errors');
const connection = require('../config/db_connection');
const sql = require('../config/query');
const issueLabelModel = require('./issue_label');

const issueModel = {
  insert: async ({
    writer, title, milestone, writeTime, labelArr,
  }) => {
    const issueTableData = [writer, writeTime, title, milestone];
    await connection.beginTransaction();
    try {
      const [res] = await connection.query(sql.insertIssue, issueTableData);
      const { insertId: issueId } = res;
      await issueLabelModel.insert(issueId, labelArr);
      await connection.commit();
      return issueId;
    } catch (err) {
      console.error(err);
      connection.rollback();
      // TODO: 에러처리 어떻게 할까
      throw createError(500);
    }
  },
};

module.exports = issueModel;
