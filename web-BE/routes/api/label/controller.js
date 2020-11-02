const labelModel = require('../../../models/label');

const labelController = {
  create: (req, res) => {
    const { name, description ,color } = req.body;
    labelModel.insert([name, description ,color]);
    res.json({ message: 'create a label successfully' });
  },
  read: async (req, res) => {
    const labelArr = await labelModel.select();
    res.json({ labelArray: labelArr });
  },
  update: (req, res) => {
    const { name, description ,color } = req.body;
    labelModel.update([name, description ,color, parseInt(req.params.labelid)]);
    res.json({ message: 'update the label successfully' });
  },
  delete: (req, res) => {
    labelModel.delete(req.params.labelid);
    res.json({ message: 'delete the label successfully' });
  },
};

module.exports = labelController;