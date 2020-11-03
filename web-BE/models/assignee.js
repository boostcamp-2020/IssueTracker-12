const connection = require('../config/db_connection');
const sql = require('../config/query');

const assigneeModel = {
  insert: async (issueId, userId) => {
    await connection.query(sql.insertAssignee, [issueId, userId]);
  },
  delete: async (issueId, userId) => {
    await connection.query(sql.deleteAssignee, [issueId, userId]);
  },
};

module.exports = assigneeModel;
