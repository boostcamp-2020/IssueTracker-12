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
  update: async (label_name, description, color, labelid) => {
    try {
      connection.query(sql.updateLabel, [
        label_name,
        description,
        color,
        labelid,
      ]);
    } catch (err) {
      console.error(err);
    }
  },
  delete: async (labelid) => {
    try {
      await connection.query(sql.deleteLabel, +labelid);
    } catch (err) {
      console.error(err);
    }
  },
};

module.exports = labelModel;
