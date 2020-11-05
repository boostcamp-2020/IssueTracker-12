const connection = require('../config/db_connection');
const sql = require('../config/query');

const commentModel = {
  insert: async ([writer, content, writeTime, isIssueContent, issueId]) => {
    const paramArr = [writer, content, writeTime, isIssueContent, issueId];
    try {
      const res = await connection.query(sql.insertComment, paramArr);
      return res[0].insertId;
    } catch (err) { console.error(err); }
  },
  select: async (commentId) => {
    try {
      const res = await connection.query(sql.selectComment, [commentId]);
      return res[0];
    } catch (err) { console.error(err); }
  },
  update: async ([issueId, commentId]) => {
    try {
      connection.query(sql.updateComment, [issueId, commentId]);
    } catch (err) { console.error(err); }
  },
};

module.exports = commentModel;
