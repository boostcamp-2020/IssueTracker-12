const { NotExtended } = require('http-errors');
const issueModel = require('../../../models/issue');

const issueController = {
  create: async (req, res, next) => {
    const {
      writer,
      title,
      milestone,
      write_time: writeTime,
      label: labelArr,
    } = req.body;
    try {
      const insertId = await issueModel.insert({
        writer, title, milestone, writeTime, labelArr,
      });
      res.status(200).json({ insertId });
    } catch (error) {
      next(error);
    }
  },
  read: async (req, res) => {

  },
  update: (req, res) => {

  },
  delete: (req, res) => {

  },
};

module.exports = issueController;
