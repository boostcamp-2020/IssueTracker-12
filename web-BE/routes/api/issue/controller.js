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
  read: async (req, res, next) => {
    try {
      const issueArr = await issueModel.select();
      res.status(200).json(issueArr);
    } catch (error) {
      next(error);
    }
  },
  updateTitle: async (req, res, next) => {
    const { issueId } = req.params;
    const { title } = req.body;
    try {
      await issueModel.updateTitle(issueId, title);
      res.sendStatus(200);
    } catch (error) {
      next(error);
    }
  },
  addMilestone: async (req, res, next) => {
    const { issueId, milestoneId } = req.params;
    try {
      await issueModel.insertMilestone(issueId, milestoneId);
      res.sendStatus(200);
    } catch (error) {
      next(error);
    }
  },
  deleteMilestone: async (req, res, next) => {
    const { issueId } = req.params;
    try {
      await issueModel.deleteMilestone(issueId);
      res.sendStatus(200);
    } catch (error) {
      next(error);
    }
  },
  delete: (req, res) => {

  },
};

module.exports = issueController;
