const connection = require('../config/db_connection');
const sql = require('../config/query');

const assigneeModel = {
  insert: async (issueId, userId) => {
    await connection.query(sql.insertAssignee, [issueId, userId]);
  },
  delete: async (issueId, userId) => {
    await connection.query(sql.deleteAssignee, [issueId, userId]);
  },
  select: async (issueId) => {
    const [res] = await connection.query(sql.selectAssignee, [issueId]);
    return res;
  },
};

module.exports = assigneeModel;
