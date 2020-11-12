const issueModel = require("../../../../models/issue");

const aIssueController = {
  readById: async (req, res, next) => {
    const { issueId } = req.params;
    try {
      const issue = await issueModel.selectById(issueId);
      console.log("?", issue);
      res.status(200).json({ issue });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = aIssueController;
