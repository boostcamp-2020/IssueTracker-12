const createError = require('http-errors');
const commentModel = require('../../../../models/comment');

const commentController = {
  create: async (req, res, next) => {
    const { issueId } = req.params;
    const {
      writer,
      content,
      write_teme: writeTime,
      is_issue_content: isIssueContent,
    } = req.body;
    try {
      const commentData = [writer, content, writeTime, isIssueContent, issueId];
      const insertId = await commentModel.insert(commentData);
      res.status(200).json({ insertId });
    } catch (err) {
      console.error(err);
      next(createError(500));
    }
  },
  read: async (req, res, next) => {
    try {
      const { issueId } = req.params;
      const commentArr = await commentModel.select(issueId);
      res.status(200).json({ commentArr });
    } catch (err) {
      console.error(err);
      next(createError(500));
    }
  },
  update: async (req, res) => {
    try {
      const { commentId } = req.params;
      const { content } = req.body;
      await commentModel.update([content, commentId]);
      res.sendStatus(200);
    } catch (err) {
      console.error(err);
      next(createError(500));
    }
  },
};

module.exports = commentController;
