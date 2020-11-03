module.exports = {
  // label
  insertLabel: 'INSERT INTO Label (name,description,color) VALUE(?,?,?);',
  selectLabel: 'SELECT label_id, name, description, color FROM Label;',
  updateLabel:
    'UPDATE Label SET name=?, description=?, color=? WHERE label_id=?;',
  deleteLabel: 'DELETE FROM Label WHERE label_id=?;',
  // milestone
  insertMilestone:
    'INSERT INTO Milestone (title,due_date,content) VALUES (?,?,?);',
  selectMilestone:
    'SELECT milestone_id,title,date_format(due_date,"%Y-%m-%d") AS due_date,content FROM Milestone;',
  updateMilestone:
    'UPDATE Milestone SET title=?, due_date=?, content=? WHERE milestone_id=?;',
  deleteMilestone: 'DELETE FROM Milestone WHERE milestone_id=?;',
  // user
  selectUser: 'SELECT user_id, username, social FROM User WHERE username=? and social=?',
  // issue
  insertIssue:
    'INSERT INTO Issue '
    + '(writer_id, write_time, title, is_open, milestone_id) '
    + 'VALUES((SELECT user_id from User WHERE username=?), ?, ?, 1, ?)',
  selectIssue:
    `SELECT
      Issue.issue_id,
      Issue.title,
      Milestone.milestone_id,
      Milestone.title as milestone_title,
      Issue.write_time,
      Issue.is_open,
      \`User\`.user_id as writer_id,
      \`User\`.username as writer
    FROM Issue
      LEFT JOIN Milestone ON Milestone.milestone_id = Issue.milestone_id
      JOIN \`User\` ON Issue.writer_id = \`User\`.user_id`,
  updateIssueTitle: 'UPDATE Issue SET title=? WHERE issue_id=?',
  insertIssueMilestone: 'UPDATE Issue SET milestone_id=? WHERE issue_id=?',
  deleteIssueMilestone: 'UPDATE Issue SET milestone_id=NULL WHERE issue_id=?',
  // issue_label
  insertIssueLabel: 'INSERT INTO Issue_Label (issue_id, label_id) VALUES ?',
  deleteIssueLabel: 'DELETE FROM Issue_Label WHERE issue_id=? and label_id=?',
  selectIssueLabel:
    'select Label.label_id, Label.`name` as label_name, Label.description, Label.color from Issue_Label '
    + 'join Label on Issue_Label.label_id = Label.label_id WHERE Issue_Label.issue_id = ?',
};
