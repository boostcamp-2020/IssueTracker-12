const createError = require("http-errors");
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
  update: async (issueId, assigneeArr) => {
    const issueAssigneeArr = assigneeArr.map((assignee) => [+issueId, assignee]);
    console.log(issueAssigneeArr);
    await connection.beginTransaction();
    try {
      await connection.query(sql.deleteAllAssignee, [issueId]);
      if (assigneeArr.length) await connection.query(sql.bulkInsertAssignee, [issueAssigneeArr]);
      await connection.commit();
    } catch (err) {
      console.error(err);
      connection.rollback();
      throw createError(500);
    }
  }
};

module.exports = assigneeModel;
