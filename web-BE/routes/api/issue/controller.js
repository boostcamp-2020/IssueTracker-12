const issueModel = require("../../../models/issue");
const issueLabelModel = require("../../../models/issue_label");
const assigneeModel = require("../../../models/assignee");

const issueController = {
  create: async (req, res, next) => {
    const {
      writer,
      title,
      milestone_id: milestone,
      write_time: writeTime,
      labels: labelArr,
    } = req.body;
    try {
      const insertId = await issueModel.insert({
        writer,
        title,
        milestone,
        writeTime,
        labelArr,
      });
      res.status(200).json({ insertId });
    } catch (error) {
      next(error);
    }
  },
  read: async (req, res, next) => {
    try {
      const { user_id: userId } = req.user;
      const issueArr = await issueModel.select(userId);
      res.status(200).json({ issueArr });
    } catch (error) {
      next(error);
    }
  },
  readById: async (req, res, next) => {
    const { issueId } = req.params;
    const { user_id: userId } = req.user;
    try {
      const issue = await issueModel.selectById(userId, issueId);
      console.log("?", issue);
      res.status(200).json({ issue });
    } catch (error) {
      next(error);
    }
  },
  updateTitle: async (req, res, next) => {
    const { issueId } = req.params;
    const { title } = req.body;
    try {
      await issueModel.updateTitle(issueId, title);
      res.status(200).json({ message: "sucess" });
    } catch (error) {
      next(error);
    }
  },
  addMilestone: async (req, res, next) => {
    const { issueId, milestoneId } = req.params;
    try {
      await issueModel.insertMilestone(issueId, milestoneId);
      res.status(200).json({ message: "sucess" });
    } catch (error) {
      next(error);
    }
  },
  deleteMilestone: async (req, res, next) => {
    const { issueId } = req.params;
    try {
      await issueModel.deleteMilestone(issueId);
      res.status(200).json({ message: "sucess" });
    } catch (error) {
      next(error);
    }
  },
  addLabel: async (req, res, next) => {
    const { issueId, labelId } = req.params;
    try {
      await issueLabelModel.insert(issueId, [labelId]);
      res.status(200).json({ message: "sucess" });
    } catch (error) {
      next(error);
    }
  },
  deleteLabel: async (req, res, next) => {
    const { issueId, labelId } = req.params;
    try {
      await issueLabelModel.delete(issueId, labelId);
      res.status(200).json({ message: "sucess" });
    } catch (error) {
      next(error);
    }
  },
  updateIsOpen: async (req, res, next) => {
    const { issueId } = req.params;
    const { is_open: isOpen } = req.body;
    try {
      await issueModel.updateIsOpen(issueId, isOpen);
      res.status(200).json({ message: "sucess" });
    } catch (error) {
      next(error);
    }
  },
  addAssignee: async (req, res, next) => {
    const { issueId, userId } = req.params;
    try {
      await assigneeModel.insert(issueId, userId);
      res.status(200).json({ message: "sucess" });
    } catch (error) {
      next(error);
    }
  },
  deleteAssignee: async (req, res, next) => {
    const { issueId, userId } = req.params;
    try {
      await assigneeModel.delete(issueId, userId);
      res.status(200).json({ message: "sucess" });
    } catch (error) {
      next(error);
    }
  },
  readAssignee: async (req, res, next) => {
    const { issueId } = req.params;
    try {
      const assignee = await assigneeModel.select(issueId);
      res.status(200).json({ assgineeArr: assignee });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = issueController;
