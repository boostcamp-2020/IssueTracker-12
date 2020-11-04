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

};

module.exports = commentModel;
