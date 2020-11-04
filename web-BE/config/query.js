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









  // comment
  insertComment:
    'INSERT INTO Comment(writer_id, content, write_time, is_issue_content, issue_id) VALUES (?,?,?,?,?)',
  selectComment:
    'SELECT Comment.comment_id, Comment.writer_id, `User`.username, Comment.content, Comment.write_time, Comment.is_issue_content, Comment.issue_id '
    + 'FROM Comment JOIN `User` ON Comment.writer_id = `User`.user_id WHERE Comment.issue_id = ?',

};
