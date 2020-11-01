const connection = require("../config/db_connection");
const sql = require("../config/query");

const milestoneModel = {
  insert: async (insertInfo) => {
    try {
      connection.query(sql.insertMilestone, insertInfo);
    } catch (err) {
      console.error(err);
    }
  },
  select: async () => {
    try {
      const res = await connection.query(sql.selectMilestone);
      return res[0];
    } catch (err) {
      console.error(err);
    }
  },
  update: async (updateInfo) => {
    try {
      connection.query(sql.updateMilestone, updateInfo);
    } catch (err) {
      console.error(err);
    }
  },
  delete: async (milestoneid) => {
    try {
      connection.query(sql.deleteMilestone, milestoneid);
    } catch (err) {
      console.error(err);
    }
  },
};

module.exports = milestoneModel;
