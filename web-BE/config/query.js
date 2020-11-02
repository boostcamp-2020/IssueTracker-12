module.exports = {
  // label
  insertLabel: 'INSERT INTO Label (name,description,color) VALUE(?,?,?);',
  selectLabel: 'SELECT * FROM Label',
  updateLabel: 'UPDATE Label SET name=?, description=?, color=?, WHERE label_id=?;',
  deleteLabel: 'DELETE FROM Label WHERE label_id=?;',
  // user
  selectUser: 'SELECT user_id, username, password, social FROM User WHERE username=? and social=?',
};
