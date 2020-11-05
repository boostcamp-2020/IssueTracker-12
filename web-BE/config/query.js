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
    + '(writer_id, write_time, title, milestone_id) '
    + 'VALUES((SELECT user_id from User WHERE username=?), ?, ?, ?)',
  selectIssue:
    `SELECT
      Issue.issue_id,
      Issue.title,
      Milestone.milestone_id,
      Milestone.title as milestone_title,
      Issue.write_time,
      Issue.is_open,
      User.user_id as writer_id,
      User.username as writer,
      ifnull(User_Assign.assign_count, 0) as is_assigned,
      ifnull(User_Write.comment_count, 0) as is_mentioned
    FROM Issue
      LEFT JOIN Milestone ON Milestone.milestone_id = Issue.milestone_id
      JOIN User ON Issue.writer_id = User.user_id
      left JOIN (SELECT issue_id, COUNT(user_id) as assign_count FROM Assignee WHERE user_id=? group by issue_id) as User_Assign ON Issue.issue_id = User_Assign.issue_id
      left JOIN (SELECT issue_id, COUNT(writer_id) as comment_count FROM Comment WHERE writer_id=? group by issue_id) as User_Write ON Issue.issue_id = User_Write.issue_id;`,
  updateIssueTitle: 'UPDATE Issue SET title=? WHERE issue_id=?',
  insertIssueMilestone: 'UPDATE Issue SET milestone_id=? WHERE issue_id=?',
  deleteIssueMilestone: 'UPDATE Issue SET milestone_id=NULL WHERE issue_id=?',
  updateIssueIsOpen: 'UPDATE Issue SET is_open=? WHERE issue_id=?',
  // issue_label
  insertIssueLabel: 'INSERT INTO Issue_Label (issue_id, label_id) VALUES ?',
  deleteIssueLabel: 'DELETE FROM Issue_Label WHERE issue_id=? and label_id=?',
  selectIssueLabel:
    'select Label.label_id, Label.name as label_name, Label.description, Label.color from Issue_Label '
    + 'join Label on Issue_Label.label_id = Label.label_id WHERE Issue_Label.issue_id = ?',
  // Assignee
  insertAssignee: 'INSERT INTO Assignee(issue_id, user_id) VALUES (?, ?)',
  deleteAssignee: 'DELETE FROM Assignee WHERE issue_id=? and user_id=?',
  selectAssignee:
    'SELECT User.user_id, User.username, User.social from Assignee '
    + 'JOIN User ON Assignee.user_id = User.user_id WHERE Assignee.issue_id=?',
  // comment
  insertComment:
    'INSERT INTO Comment(writer_id, content, write_time, is_issue_content, issue_id) VALUES (?,?,?,?,?)',
  selectComment:
    'SELECT Comment.comment_id, Comment.writer_id, `User`.username, Comment.content, Comment.write_time, Comment.is_issue_content, Comment.issue_id '
    + 'FROM Comment JOIN `User` ON Comment.writer_id = `User`.user_id WHERE Comment.issue_id = ?',
  updateComment:
    'UPDATE Comment set content=? WHERE comment_id=?',
};
