const createError = require("http-errors");
const connection = require("../config/db_connection");
const sql = require("../config/query");
const assigneeModel = require("./assignee");
const issueLabelModel = require("./issue_label");

const issueModel = {
  insert: async ({ writer, title, milestone, writeTime, labelArr }) => {
    const issueTableData = [writer, writeTime, title, milestone];
    await connection.beginTransaction();
    try {
      const [res] = await connection.query(sql.insertIssue, issueTableData);
      const { insertId: issueId } = res;
      await issueLabelModel.insert(issueId, labelArr);
      await connection.commit();
      return issueId;
    } catch (err) {
      console.error(err);
      connection.rollback();
      throw createError(500);
    }
  },
  select: async (userId) => {
    try {
      const [issueArr] = await connection.query(sql.selectIssue, [
        userId,
        userId,
      ]);
      const labelsOfIssue = await Promise.all(
        issueArr.map((issue) => issueLabelModel.select(issue.issue_id))
      );
      const assigneeOfIssue = await Promise.all(
        issueArr.map((issue) => assigneeModel.select(issue.issue_id))
      );
      const issueWithLabels = issueArr.map((issue, i) => ({
        ...issue,
        labels: labelsOfIssue[i],
        assignee: assigneeOfIssue[i],
      }));
      return issueWithLabels;
    } catch (err) {
      console.error(err);
      throw createError(500);
    }
  },
  selectById: async (userId, issueId) => {
    try {
      const [[issue]] = await connection.query(sql.selectIssueById, [userId, userId, issueId]);
      const labelsOfIssue = await issueLabelModel.select(issue.issue_id);
      const assigneeOfIssue = await assigneeModel.select(issue.issue_id);

      const issueWithLabels = {
        ...issue,
        labels: labelsOfIssue,
        assignee: assigneeOfIssue,
      };
      return issueWithLabels;
    } catch (err) {
      console.error(err);
      throw createError(500);
    }
  },
  updateTitle: async (issueId, title) => {
    try {
      await connection.query(sql.updateIssueTitle, [title, issueId]);
    } catch (err) {
      console.error(err);
      throw createError(500);
    }
  },
  insertMilestone: async (issueId, milestoneId) => {
    try {
      await connection.query(sql.insertIssueMilestone, [milestoneId, issueId]);
    } catch (err) {
      console.error(err);
      throw createError(500);
    }
  },
  deleteMilestone: async (issueId) => {
    try {
      await connection.query(sql.deleteIssueMilestone, [issueId]);
    } catch (err) {
      console.error(err);
      throw createError(500);
    }
  },
  updateMilestone: async (issueId, milestoneId) => {
    await connection.beginTransaction();
    try {
      await connection.query(sql.deleteIssueMilestone, [milestoneId]);
      await connection.query(sql.insertIssueMilestone, [milestoneId, issueId]);

      await connection.commit();
    } catch (err) {
      console.error(err);
      connection.rollback();
      throw createError(500);
    }
  },
  updateIsOpen: async (issueId, isOpen) => {
    try {
      await connection.query(sql.updateIssueIsOpen, [isOpen, issueId]);
    } catch (err) {
      console.error(err);
      throw createError(500);
    }
  },
};

module.exports = issueModel;
