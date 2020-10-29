const connection = require('../config/db_connection');
const query = require('../util/query');
const jsonToArr = require('../util/jsonToArr');

const labelModel = {
  insert: async(reqBodyJson) => {
    const paramArr = jsonToArr(reqBodyJson)
    try {connection.promise().query(sql.insertLabel. paramArr)}
    catch (err) {console.error(err)}
  },
  select: async(labelid) => {
    try {
      const res = await connection.promise().query(sql.selectLabel, labelid)
      return res[0]
    }
    catch (err) {console.error(err)}
  },
  update: async(reqBodyJson) => {
    const paramArr = jsonToArr(reqBodyJson)
    try {connection.promise().query(sql.updateLabel, paramArr); }
    catch (err) {console.error(err);}
  },
  delete: async(labelid) => {
    try {connection.promise().query(sql.deleteLabel, labelid ); }
    catch (err) {console.error(err);}
  }
};

module.exports = labelModel;