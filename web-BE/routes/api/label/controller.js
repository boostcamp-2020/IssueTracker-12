const labelModel = require('../../../models/label');

const labelController = {
  create: async (req, res) => {
    const { name, description ,color } = req.body;
    const insertId = await labelModel.insert([name, description ,color]);
    res.status(200).json({insertId})
  },
  read: async (req, res) => {
    const labelArr = await labelModel.select();
    res.status(200).json({ labelArray: labelArr });
  },
  update: (req, res) => {
    const { name, description ,color } = req.body;
    labelModel.update([name, description ,color, parseInt(req.params.labelid)]);
    res.status(200).json({ message: 'update the label successfully' });
  },
  delete: (req, res) => {
    labelModel.delete(req.params.labelid);
    res.status(200).json({ message: 'delete the label successfully' });
  },
};

module.exports = labelController;