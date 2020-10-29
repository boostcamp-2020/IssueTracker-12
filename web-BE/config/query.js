module.exports = {
    // label 
    insertLabel : "INSERT INTO Label (name,description,color) VALUE(?,?,?);",
    selectLabel : "SELECT * FROM Label",
    updateLabel : "UPDATE Label SET name=?, description=?, color=?, WHERE label_id=?;",
    deleteLabel : "DELETE FROM Label WHERE label_id=?;"
}