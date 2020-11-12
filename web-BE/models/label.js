const connection = require("../config/db_connection");
const sql = require("../config/query");

const labelModel = {
  insert: async (name, description, color) => {
    try {
      const res = await connection.query(sql.insertLabel, [
        name,
        description,
        color,
      ]);
      return res[0].insertId;
    } catch (err) {
      console.error(err);
    }
  },
  select: async () => {
    try {
      const res = await connection.query(sql.selectLabel);
      return res[0];
    } catch (err) {
      console.error(err);
    }
  },
  update: async (paramArr) => {
    try {
      connection.query(sql.updateLabel, paramArr);
    } catch (err) {
      console.error(err);
    }
  },
  delete: async (labelid) => {
    try {
      connection.query(sql.deleteLabel, labelid);
    } catch (err) {
      console.error(err);
    }
  },
};

module.exports = labelModel;
