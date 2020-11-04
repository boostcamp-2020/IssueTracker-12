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
  
};

module.exports = commentController;
