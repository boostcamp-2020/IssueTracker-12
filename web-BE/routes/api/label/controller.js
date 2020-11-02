const labelModel = require('../../../models/label');

const labelController = {
  create: (req, res) => {
    const { name, color } = req.body;
    labelModel.insert();
    res.json({ message: 'create a label successfully' });
  },
  read: async (req, res) => {
    const labelArr = await labelModel.select();
    res.json({ labelArray: labelArr });
  },
  update: (req, res) => {
    labelModel.update(req.body);
    res.json({ message: 'update the label successfully' });
  },
  delete: (req, res) => {
    labelModel.delete(req.params.labelid);
    res.json({ message: 'delete the label successfully' });
  },
};

module.exports = labelController;
